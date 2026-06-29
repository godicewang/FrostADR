import SwiftUI

struct PageHeader: View {
  let title: String
  let subtitle: String
  let path: String

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      VStack(alignment: .leading, spacing: 6) {
        Text(path)
          .font(.caption)
          .foregroundStyle(FrostTheme.mutedText)

        Text(title)
          .font(.system(size: 26, weight: .semibold))

        Text(subtitle)
          .font(.system(size: 13))
          .foregroundStyle(FrostTheme.mutedText)
          .fixedSize(horizontal: false, vertical: true)
      }

      Spacer()
    }
    .padding(.bottom, 4)
  }
}

struct PageHeader_Previews: PreviewProvider {
  static var previews: some View {
    PageHeader(title: "Dashboard", subtitle: "端上 Agent 风险态势与保护模块状态。", path: "FrostADR / Dashboard")
      .padding()
  }
}
