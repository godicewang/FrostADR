import SwiftUI

struct SectionHeader: View {
  let title: String
  var subtitle: String?

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(title)
        .font(.system(size: 15, weight: .semibold))

      if let subtitle {
        Text(subtitle)
          .font(.caption)
          .foregroundStyle(FrostTheme.mutedText)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeader(title: "区域", subtitle: "后续数据接入的结构占位")
      .padding()
  }
}
