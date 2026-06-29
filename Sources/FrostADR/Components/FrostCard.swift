import SwiftUI

struct FrostCard<Content: View>: View {
  private let title: String?
  private let subtitle: String?
  private let content: Content

  init(
    _ title: String? = nil,
    subtitle: String? = nil,
    @ViewBuilder content: () -> Content
  ) {
    self.title = title
    self.subtitle = subtitle
    self.content = content()
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      if title != nil || subtitle != nil {
        VStack(alignment: .leading, spacing: 4) {
          if let title {
            Text(title)
              .font(.system(size: 14, weight: .semibold))
          }

          if let subtitle {
            Text(subtitle)
              .font(.caption)
              .foregroundStyle(FrostTheme.mutedText)
          }
        }
      }

      content
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .topLeading)
    .background(
      RoundedRectangle(cornerRadius: FrostTheme.radius, style: .continuous)
        .fill(FrostTheme.cardBackground)
    )
    .overlay(
      RoundedRectangle(cornerRadius: FrostTheme.radius, style: .continuous)
        .stroke(FrostTheme.border, lineWidth: 1)
    )
  }
}

struct FrostCard_Previews: PreviewProvider {
  static var previews: some View {
    FrostCard("区域标题", subtitle: "结构占位") {
      EmptyStateView(title: "等待端上数据接入", message: "该区域将在真实数据源接入后呈现内容。", compact: true)
    }
    .padding()
  }
}
