import SwiftUI

enum FrostRoute: String, CaseIterable, Identifiable, Hashable {
  case dashboard
  case agentInventory
  case mcpSkill
  case staticScan
  case alerts
  case sessionGraph
  case policy
  case approval
  case settings

  var id: String { rawValue }

  var title: String {
    switch self {
    case .dashboard:
      "总览 Dashboard"
    case .agentInventory:
      "Agent 资产"
    case .mcpSkill:
      "MCP / Skill"
    case .staticScan:
      "静态扫描"
    case .alerts:
      "告警 Alerts"
    case .sessionGraph:
      "Session Graph"
    case .policy:
      "策略 Rules / Policy"
    case .approval:
      "审批 Approval"
    case .settings:
      "设置 Settings"
    }
  }

  var shortTitle: String {
    switch self {
    case .dashboard:
      "Dashboard"
    case .agentInventory:
      "Agent Inventory"
    case .mcpSkill:
      "MCP / Skill"
    case .staticScan:
      "Static Scan"
    case .alerts:
      "Alerts"
    case .sessionGraph:
      "Session Graph"
    case .policy:
      "Rules / Policy"
    case .approval:
      "Approval"
    case .settings:
      "Settings"
    }
  }

  var systemImage: String {
    switch self {
    case .dashboard:
      "gauge.with.dots.needle.67percent"
    case .agentInventory:
      "laptopcomputer.and.magnifyingglass"
    case .mcpSkill:
      "puzzlepiece.extension"
    case .staticScan:
      "doc.text.magnifyingglass"
    case .alerts:
      "exclamationmark.triangle"
    case .sessionGraph:
      "point.3.connected.trianglepath.dotted"
    case .policy:
      "checklist.checked"
    case .approval:
      "person.badge.shield.checkmark"
    case .settings:
      "gearshape"
    }
  }

  @MainActor
  @ViewBuilder
  var destination: some View {
    switch self {
    case .dashboard:
      DashboardView()
    case .agentInventory:
      AgentInventoryView()
    case .mcpSkill:
      MCPSkillView()
    case .staticScan:
      StaticScanView()
    case .alerts:
      AlertsView()
    case .sessionGraph:
      SessionGraphView()
    case .policy:
      PolicyView()
    case .approval:
      ApprovalView()
    case .settings:
      SettingsView()
    }
  }
}
