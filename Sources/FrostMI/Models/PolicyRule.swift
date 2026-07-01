import Foundation

struct PolicyRule: Identifiable, Hashable {
  var id: UUID
  var name: String
  var phase: RuntimePhase
  var action: PolicyAction
  var enabled: Bool
  var rulePackIdentifier: String?

  init(
    id: UUID = UUID(),
    name: String,
    phase: RuntimePhase,
    action: PolicyAction,
    enabled: Bool = false,
    rulePackIdentifier: String? = nil
  ) {
    self.id = id
    self.name = name
    self.phase = phase
    self.action = action
    self.enabled = enabled
    self.rulePackIdentifier = rulePackIdentifier
  }
}

enum PolicyAction: String, CaseIterable, Hashable {
  case observe
  case score
  case allow
  case block
  case rewrite
  case redact
  case sanitize
  case confirm
  case sandbox
  case quarantine
  case rateLimit
  case alert
}
