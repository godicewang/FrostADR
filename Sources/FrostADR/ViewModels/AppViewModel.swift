import Foundation

@MainActor
final class AppViewModel: ObservableObject {
  @Published var agentAssets: [AgentAsset] = []
  @Published var mcpServers: [MCPServerAsset] = []
  @Published var skills: [SkillAsset] = []
  @Published var staticFindings: [StaticFinding] = []
  @Published var runtimeAlerts: [RuntimeAlert] = []
  @Published var sessionEvents: [SessionEvent] = []
  @Published var policyRules: [PolicyRule] = []
  @Published var approvalRequests: [ApprovalRequest] = []
}
