import SwiftUI

enum SeverityBadgeLevel: String, CaseIterable, Identifiable {
  case informational = "Info"
  case low = "Low"
  case medium = "Medium"
  case high = "High"
  case critical = "Critical"

  var id: String { rawValue }

  var tone: StatusBadgeTone {
    switch self {
    case .informational:
      .info
    case .low:
      .healthy
    case .medium:
      .warning
    case .high, .critical:
      .critical
    }
  }
}

struct SeverityBadge: View {
  let level: SeverityBadgeLevel

  var body: some View {
    StatusBadge(label: level.rawValue, tone: level.tone)
  }
}

struct SeverityBadge_Previews: PreviewProvider {
  static var previews: some View {
    HStack {
      ForEach(SeverityBadgeLevel.allCases) { level in
        SeverityBadge(level: level)
      }
    }
    .padding()
  }
}
