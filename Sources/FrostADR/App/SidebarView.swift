import SwiftUI

struct SidebarView: View {
  @Binding var selection: FrostRoute

  var body: some View {
    VStack(spacing: 0) {
      brandHeader

      ScrollView {
        VStack(spacing: 6) {
          ForEach(FrostRoute.allCases) { route in
            SidebarItem(
              route: route,
              isSelected: route == selection
            ) {
              selection = route
            }
          }
        }
        .padding(.horizontal, 12)
        .padding(.top, 12)
      }

      endpointStatus
    }
    .background(FrostTheme.sidebarBackground)
  }

  private var brandHeader: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 10) {
        ZStack {
          RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(FrostTheme.accent.opacity(0.18))
            .overlay(
              RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(FrostTheme.accent.opacity(0.34), lineWidth: 1)
            )

          Image(systemName: "shield.lefthalf.filled")
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(FrostTheme.accent)
        }
        .frame(width: 34, height: 34)

        VStack(alignment: .leading, spacing: 2) {
          Text("FrostADR")
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(.white)

          Text("Agent-EDR")
            .font(.caption)
            .foregroundStyle(FrostTheme.sidebarMutedText)
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal, 18)
    .padding(.top, 20)
    .padding(.bottom, 16)
  }

  private var endpointStatus: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Endpoint 状态")
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundStyle(FrostTheme.sidebarMutedText)

        Spacer()

        StatusBadge(label: "待接入", tone: .neutral)
      }

      Text("等待端上数据接入")
        .font(.caption)
        .foregroundStyle(FrostTheme.sidebarMutedText)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 8, style: .continuous)
        .fill(Color.white.opacity(0.055))
        .overlay(
          RoundedRectangle(cornerRadius: 8, style: .continuous)
            .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
    )
    .padding(12)
  }
}

private struct SidebarItem: View {
  let route: FrostRoute
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 10) {
        Image(systemName: route.systemImage)
          .font(.system(size: 15, weight: .semibold))
          .frame(width: 20)
          .foregroundStyle(isSelected ? .white : FrostTheme.sidebarMutedText)

        Text(route.title)
          .font(.system(size: 13, weight: isSelected ? .semibold : .medium))
          .foregroundStyle(isSelected ? .white : FrostTheme.sidebarText)

        Spacer()
      }
      .padding(.horizontal, 10)
      .frame(height: 36)
      .background(
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(isSelected ? FrostTheme.sidebarSelection : Color.clear)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .stroke(isSelected ? FrostTheme.accent.opacity(0.28) : Color.clear, lineWidth: 1)
      )
    }
    .buttonStyle(.plain)
  }
}

struct SidebarView_Previews: PreviewProvider {
  static var previews: some View {
    SidebarView(selection: .constant(.dashboard))
      .frame(width: 256, height: 760)
  }
}
