import SwiftUI

struct FrostModulePlaceholderView: View {
  let route: FrostRoute

  var body: some View {
    FrostPage {
      PageHeader(
        title: route.title,
        subtitle: route.subtitle,
        path: "FrostMI / \(route.title)"
      )

      FrostCard(route.title, subtitle: "Local-first module scaffold") {
        VStack(alignment: .leading, spacing: 18) {
          HStack(alignment: .top, spacing: 14) {
            ZStack {
              RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(FrostTheme.accent.opacity(0.13))
                .overlay(
                  RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(FrostTheme.accent.opacity(0.28), lineWidth: 1)
                )

              Image(systemName: route.systemImage)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(FrostTheme.accent)
            }
            .frame(width: 48, height: 48)

            VStack(alignment: .leading, spacing: 7) {
              Text(route.emptyStateTitle)
                .font(.system(size: 17, weight: .bold))

              Text(route.emptyStateMessage)
                .font(.system(size: 12))
                .foregroundStyle(FrostTheme.mutedText)
                .fixedSize(horizontal: false, vertical: true)

              HStack(spacing: 7) {
                StatusBadge(label: "Local First", tone: .healthy)
                StatusBadge(label: "No Mock Data", tone: .neutral)
                StatusBadge(label: "Audit Ready", tone: .info)
              }
            }

            Spacer(minLength: 0)
          }

          Divider()

          EmptyStateView(
            title: "等待真实端上数据接入",
            message: "该模块当前只保留结构、导航和真实空状态，后续接入本地服务后展示可审计数据。",
            systemImage: route.systemImage
          )
          .frame(minHeight: 280)
        }
      }
    }
  }
}

struct FrostModulePlaceholderView_Previews: PreviewProvider {
  static var previews: some View {
    FrostModulePlaceholderView(route: .promptCopilot)
      .frame(width: 1100, height: 720)
  }
}
