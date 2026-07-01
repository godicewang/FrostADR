import Foundation

final class ColdStartScanner: @unchecked Sendable {
  private let knownAgentScanner: KnownAgentScanner
  private let keywordScanner: KeywordFileScanner
  private let processInspector: ProcessInspector
  private let permissionInspector: FileSystemPermissionInspector
  private let endpointSecurityMonitor: EndpointSecurityMonitor
  private let networkFlowMonitor: NetworkFlowMonitor
  private let config: DiscoveryConfiguration

  var isColdStartEnabled: Bool {
    config.enableColdStartScan
  }

  init(
    knownAgentScanner: KnownAgentScanner,
    keywordScanner: KeywordFileScanner,
    processInspector: ProcessInspector,
    permissionInspector: FileSystemPermissionInspector,
    endpointSecurityMonitor: EndpointSecurityMonitor,
    networkFlowMonitor: NetworkFlowMonitor,
    config: DiscoveryConfiguration
  ) {
    self.knownAgentScanner = knownAgentScanner
    self.keywordScanner = keywordScanner
    self.processInspector = processInspector
    self.permissionInspector = permissionInspector
    self.endpointSecurityMonitor = endpointSecurityMonitor
    self.networkFlowMonitor = networkFlowMonitor
    self.config = config
  }

  func runFullScan() -> DiscoveryScanResult {
    var result = DiscoveryScanResult()
    let deadline = Date().addingTimeInterval(config.limits.maxScanSeconds)
    result.events.append(
      DiscoveryEvent(
        id: UUID(), kind: .coldStartScan, path: nil, message: "Cold start discovery scan started.",
        createdAt: result.scannedAt)
    )

    result.merge(knownAgentScanner.scan(deadline: deadline))
    if !isExpired(deadline) {
      result.merge(
        keywordScanner.scan(
          additionalRoots: keywordScanRoots(for: result.agents),
          deadline: deadline
        ))
    }
    if !isExpired(deadline) {
      result.merge(processInspector.inspectRunningProcesses(deadline: deadline))
    }
    if !config.scanRoots.isEmpty {
      result.permissionStates.append(
        contentsOf: permissionInspector.inspect(paths: config.scanRoots))
    }
    if config.enableEndpointSecurityMonitor {
      result.permissionStates.append(endpointSecurityMonitor.permissionState())
    }
    if config.enableNetworkMonitor {
      result.permissionStates.append(networkFlowMonitor.permissionState())
    }
    let timedOut = isExpired(deadline)
    result.events.append(
      DiscoveryEvent(
        id: UUID(),
        kind: .coldStartScan,
        path: nil,
        message: timedOut
          ? "Cold start discovery scan stopped after the lightweight time budget with \(result.agents.count) agent candidates."
          : "Cold start discovery scan completed with \(result.agents.count) agent candidates.",
        createdAt: Date()
      ))
    return result
  }

  private func isExpired(_ deadline: Date) -> Bool {
    Date() >= deadline
  }

  private func keywordScanRoots(for agents: [AgentAsset]) -> [URL] {
    agents.flatMap { agent -> [URL] in
      let fileBackedPaths = agent.configPaths + agent.mcpConfigPaths + agent.executablePaths
      let fileBackedRoots = fileBackedPaths.map {
        URL(fileURLWithPath: $0).deletingLastPathComponent()
      }

      let mixedPaths =
        agent.workspacePaths + agent.skillPaths + agent.cachePaths + agent.memoryPaths
      let mixedRoots = mixedPaths.map {
        discoveryRoot(for: URL(fileURLWithPath: $0))
      }

      return fileBackedRoots + mixedRoots
    }
    .map { $0.standardizedFileURL }
    .uniqueSorted()
  }

  private func discoveryRoot(for url: URL) -> URL {
    var isDirectory: ObjCBool = false
    if FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory) {
      return isDirectory.boolValue ? url : url.deletingLastPathComponent()
    }
    return url
  }
}

extension DiscoveryScanResult {
  mutating func merge(_ other: DiscoveryScanResult) {
    agents.append(contentsOf: other.agents)
    mcpServers.append(contentsOf: other.mcpServers)
    skills.append(contentsOf: other.skills)
    contextFiles.append(contentsOf: other.contextFiles)
    memories.append(contentsOf: other.memories)
    runtimeProcesses.append(contentsOf: other.runtimeProcesses)
    evidence.append(contentsOf: other.evidence)
    permissionStates.append(contentsOf: other.permissionStates)
    events.append(contentsOf: other.events)
    scannedAt = max(scannedAt, other.scannedAt)
  }
}
