import Foundation

struct StaticFinding: Identifiable, Hashable {
  var id: UUID
  var title: String
  var category: StaticFindingCategory
  var severity: AgentRiskLevel
  var assetPath: String?
  var ruleIdentifier: String?

  init(
    id: UUID = UUID(),
    title: String,
    category: StaticFindingCategory,
    severity: AgentRiskLevel,
    assetPath: String? = nil,
    ruleIdentifier: String? = nil
  ) {
    self.id = id
    self.title = title
    self.category = category
    self.severity = severity
    self.assetPath = assetPath
    self.ruleIdentifier = ruleIdentifier
  }
}

enum StaticFindingCategory: String, CaseIterable, Hashable {
  case mcp
  case skill
  case memory
  case context
  case dependency
  case unknown
}
