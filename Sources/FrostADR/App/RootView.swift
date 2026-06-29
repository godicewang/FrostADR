import SwiftUI

struct RootView: View {
  @State private var selectedRoute: FrostRoute = .dashboard

  var body: some View {
    NavigationSplitView {
      SidebarView(selection: $selectedRoute)
        .navigationSplitViewColumnWidth(min: 236, ideal: 256, max: 292)
    } detail: {
      selectedRoute.destination
        .id(selectedRoute)
    }
    .navigationSplitViewStyle(.balanced)
    .tint(FrostTheme.accent)
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
      .environmentObject(AppViewModel())
      .environmentObject(SettingsViewModel())
  }
}
