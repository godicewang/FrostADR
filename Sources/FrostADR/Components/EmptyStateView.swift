import SwiftUI

struct EmptyStateView: View {
  let title: String
  let message: String
  var systemImage: String = "tray"
  var compact: Bool = false

  var body: some View {
    VStack(spacing: compact ? 8 : 12) {
      Image(systemName: systemImage)
        .font(.system(size: compact ? 20 : 30, weight: .semibold))
        .foregroundStyle(FrostTheme.accent.opacity(0.78))

      VStack(spacing: 4) {
        Text(title)
          .font(.system(size: compact ? 12 : 14, weight: .semibold))
          .multilineTextAlignment(.center)

        Text(message)
          .font(.caption)
          .foregroundStyle(FrostTheme.mutedText)
          .multilineTextAlignment(.center)
          .lineLimit(3)
          .fixedSize(horizontal: false, vertical: true)
      }
    }
    .frame(maxWidth: .infinity, alignment: .center)
    .padding(compact ? 10 : 18)
  }
}

struct EmptyStateView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyStateView(title: "等待端上数据接入", message: "暂无可展示内容。")
      .padding()
  }
}
