import Foundation

struct ApprovalRequest: Identifiable, Hashable {
  var id: UUID
  var title: String
  var requestedAt: Date?
  var riskLevel: AgentRiskLevel?
  var status: ApprovalStatus
  var sessionIdentifier: String?

  init(
    id: UUID = UUID(),
    title: String,
    requestedAt: Date? = nil,
    riskLevel: AgentRiskLevel? = nil,
    status: ApprovalStatus,
    sessionIdentifier: String? = nil
  ) {
    self.id = id
    self.title = title
    self.requestedAt = requestedAt
    self.riskLevel = riskLevel
    self.status = status
    self.sessionIdentifier = sessionIdentifier
  }
}

enum ApprovalStatus: String, CaseIterable, Hashable {
  case pending
  case approved
  case denied
  case expired
}
