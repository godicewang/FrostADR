import Foundation

struct RuntimeAlert: Identifiable, Hashable {
  var id: UUID
  var title: String
  var severity: AgentRiskLevel
  var phase: RuntimePhase
  var createdAt: Date?
  var sessionIdentifier: String?

  init(
    id: UUID = UUID(),
    title: String,
    severity: AgentRiskLevel,
    phase: RuntimePhase,
    createdAt: Date? = nil,
    sessionIdentifier: String? = nil
  ) {
    self.id = id
    self.title = title
    self.severity = severity
    self.phase = phase
    self.createdAt = createdAt
    self.sessionIdentifier = sessionIdentifier
  }
}

enum RuntimePhase: String, CaseIterable, Hashable {
  case agentDiscovery
  case llmRequest
  case llmResponse
  case toolDiscovery
  case toolCallPre
  case toolResultPost
  case commandPre
  case fileEvent
  case networkEvent
  case memoryWrite
  case finalResponse
}
