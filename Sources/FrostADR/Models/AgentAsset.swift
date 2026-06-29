import Foundation

struct AgentAsset: Identifiable, Hashable {
  var id: UUID
  var name: String
  var kind: AgentAssetKind
  var executablePath: String?
  var workspacePath: String?
  var confidence: Double?
  var riskLevel: AgentRiskLevel?
  var managedState: AssetManagedState?

  init(
    id: UUID = UUID(),
    name: String,
    kind: AgentAssetKind,
    executablePath: String? = nil,
    workspacePath: String? = nil,
    confidence: Double? = nil,
    riskLevel: AgentRiskLevel? = nil,
    managedState: AssetManagedState? = nil
  ) {
    self.id = id
    self.name = name
    self.kind = kind
    self.executablePath = executablePath
    self.workspacePath = workspacePath
    self.confidence = confidence
    self.riskLevel = riskLevel
    self.managedState = managedState
  }
}

enum AgentAssetKind: String, CaseIterable, Hashable {
  case agent
  case mcpConfig
  case skill
  case memory
  case contextFile
  case unknown
}

enum AgentRiskLevel: String, CaseIterable, Hashable {
  case informational
  case low
  case medium
  case high
  case critical
}

enum AssetManagedState: String, CaseIterable, Hashable {
  case unmanaged
  case observed
  case managed
  case quarantined
}
