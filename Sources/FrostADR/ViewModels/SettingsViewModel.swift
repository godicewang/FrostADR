import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
  @Published var controlPlaneAddress = ""
  @Published var protectionMode: LocalProtectionMode = .observe
  @Published var redactSecretsBeforeStorage = true
  @Published var allowControlPlaneUpload = false
  @Published var localLLMProxyEnabled = false
  @Published var localLLMProxyPort = ""
  @Published var mcpWrapperEnabled = false
  @Published var staticScanEnabled = false
  @Published var scanWorkspaceContextFiles = false
  @Published var systemSensorEnabled = false
  @Published var passiveProcessObservation = false
}

enum LocalProtectionMode: String, CaseIterable, Identifiable {
  case observe = "Observe"
  case confirm = "Confirm"
  case enforce = "Enforce"

  var id: String { rawValue }
}
