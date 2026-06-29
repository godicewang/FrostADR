import Foundation

struct SkillAsset: Identifiable, Hashable {
  var id: UUID
  var name: String
  var path: String?
  var source: SkillSource?
  var trustState: AssetManagedState?

  init(
    id: UUID = UUID(),
    name: String,
    path: String? = nil,
    source: SkillSource? = nil,
    trustState: AssetManagedState? = nil
  ) {
    self.id = id
    self.name = name
    self.path = path
    self.source = source
    self.trustState = trustState
  }
}

enum SkillSource: String, CaseIterable, Hashable {
  case local
  case workspace
  case external
  case unknown
}
