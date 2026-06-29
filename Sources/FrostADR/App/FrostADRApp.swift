import SwiftUI

@main
struct FrostADRApp: App {
  @StateObject private var appViewModel = AppViewModel()
  @StateObject private var settingsViewModel = SettingsViewModel()

  var body: some Scene {
    WindowGroup {
      RootView()
        .environmentObject(appViewModel)
        .environmentObject(settingsViewModel)
        .frame(minWidth: 1180, minHeight: 760)
    }
    .windowStyle(.hiddenTitleBar)
    .windowToolbarStyle(.unifiedCompact)
  }
}
