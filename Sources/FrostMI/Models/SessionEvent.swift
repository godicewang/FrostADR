import Foundation

struct SessionEvent: Identifiable, Hashable {
  var id: UUID
  var sessionIdentifier: String
  var type: SessionEventType
  var timestamp: Date?
  var relatedPath: String?
  var riskLevel: AgentRiskLevel?

  init(
    id: UUID = UUID(),
    sessionIdentifier: String,
    type: SessionEventType,
    timestamp: Date? = nil,
    relatedPath: String? = nil,
    riskLevel: AgentRiskLevel? = nil
  ) {
    self.id = id
    self.sessionIdentifier = sessionIdentifier
    self.type = type
    self.timestamp = timestamp
    self.relatedPath = relatedPath
    self.riskLevel = riskLevel
  }
}

enum SessionEventType: String, CaseIterable, Hashable {
  case userPrompt
  case llmRequest
  case llmResponse
  case toolDiscovery
  case toolCall
  case toolResult
  case commandExec
  case fileRead
  case fileWrite
  case networkConnect
  case memoryWrite
  case finalResponse
}
