import Foundation

struct MCPServerAsset: Identifiable, Hashable {
  var id: UUID
  var name: String
  var configurationPath: String?
  var transport: MCPTransport?
  var command: String?
  var trustState: AssetManagedState?

  init(
    id: UUID = UUID(),
    name: String,
    configurationPath: String? = nil,
    transport: MCPTransport? = nil,
    command: String? = nil,
    trustState: AssetManagedState? = nil
  ) {
    self.id = id
    self.name = name
    self.configurationPath = configurationPath
    self.transport = transport
    self.command = command
    self.trustState = trustState
  }
}

enum MCPTransport: String, CaseIterable, Hashable {
  case stdio
  case http
  case sse
  case unknown
}
