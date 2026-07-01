import SwiftUI

enum FrostRoute: String, CaseIterable, Identifiable, Hashable {
  case overview
  case promptCopilot
  case agentSensing
  case memoryProfile
  case crossAgentAssistant
  case sessionGraph
  case modelRouter
  case policyApproval
  case privacyCenter
  case settings

  var id: String { rawValue }

  var title: String {
    switch self {
    case .overview:
      "Overview"
    case .promptCopilot:
      "Prompt Copilot"
    case .agentSensing:
      "Agent Sensing"
    case .memoryProfile:
      "Memory & Profile"
    case .crossAgentAssistant:
      "Cross-Agent Assistant"
    case .sessionGraph:
      "Session Graph"
    case .modelRouter:
      "Model Router"
    case .policyApproval:
      "Policy & Approval"
    case .privacyCenter:
      "Privacy Center"
    case .settings:
      "Settings"
    }
  }

  var shortTitle: String {
    switch self {
    case .overview:
      "Overview"
    case .promptCopilot:
      "Copilot"
    case .agentSensing:
      "Sensing"
    case .memoryProfile:
      "Memory"
    case .crossAgentAssistant:
      "Assistant"
    case .sessionGraph:
      "Graph"
    case .modelRouter:
      "Models"
    case .policyApproval:
      "Policy"
    case .privacyCenter:
      "Privacy"
    case .settings:
      "Settings"
    }
  }

  var systemImage: String {
    switch self {
    case .overview:
      "rectangle.grid.2x2"
    case .promptCopilot:
      "text.cursor"
    case .agentSensing:
      "scope"
    case .memoryProfile:
      "brain.head.profile"
    case .crossAgentAssistant:
      "sparkles"
    case .sessionGraph:
      "point.3.connected.trianglepath.dotted"
    case .modelRouter:
      "arrow.triangle.branch"
    case .policyApproval:
      "checkmark.shield"
    case .privacyCenter:
      "lock.rectangle.stack"
    case .settings:
      "gearshape"
    }
  }

  var subtitle: String {
    switch self {
    case .overview:
      "Mac endpoint intelligence posture, local memory health, and runtime foundation."
    case .promptCopilot:
      "Focused-app prompt suggestions, rewrite proposals, and augmentation audit."
    case .agentSensing:
      "Local AI agent, MCP, Skill, Context, Memory, and runtime candidate discovery."
    case .memoryProfile:
      "Evidence-bound memory, typed profiles, and user/project preference compilation."
    case .crossAgentAssistant:
      "Natural-language interface grounded in local agent sessions and memories."
    case .sessionGraph:
      "Observable behavior chains across prompts, tools, commands, files, and network."
    case .modelRouter:
      "Local and external model provider routing, policy, and model-call audit."
    case .policyApproval:
      "Rules, local approvals, intervention history, and FrostADR Runtime controls."
    case .privacyCenter:
      "Learning controls, raw data boundaries, export, deletion, and local-first safety."
    case .settings:
      "Endpoint app configuration, local services, providers, and workspace boundaries."
    }
  }

  var emptyStateTitle: String {
    switch self {
    case .overview:
      "等待本机智能画像构建"
    case .promptCopilot:
      "Prompt Copilot 尚未启用"
    case .memoryProfile:
      "暂无可审计 Memory / Profile"
    case .crossAgentAssistant:
      "本地跨 Agent 助手尚未接入"
    case .sessionGraph:
      "暂无可重建 Session Graph"
    case .modelRouter:
      "暂无模型提供方配置"
    case .policyApproval:
      "暂无策略命中或审批记录"
    case .privacyCenter:
      "隐私中心等待本地状态接入"
    case .settings:
      "设置项将在后续接入本地服务"
    case .agentSensing:
      "等待本机 Agent 发现"
    }
  }

  var emptyStateMessage: String {
    switch self {
    case .overview:
      "FrostMI 会以本机感知、证据绑定记忆和 Prompt Copilot 为核心组织端上智能状态。"
    case .promptCopilot:
      "后续将提供全局快捷键、选中文本感知、建议复制/插入、接受/拒绝和审计记录。"
    case .memoryProfile:
      "长期记忆必须带有来源证据、信任边界、允许用途和可编辑状态，当前不展示假数据。"
    case .crossAgentAssistant:
      "助手将基于本地事件、Memory、Profile、FTS 和 Session Graph 回答跨 Agent 问题。"
    case .sessionGraph:
      "仅重建可观察链路，不声称获取隐藏模型思维链。"
    case .modelRouter:
      "后续会把 Apple Foundation Models、Ollama、OpenAI-compatible、DeepSeek 等放到可替换 provider 接口后。"
    case .policyApproval:
      "安全仍是 FrostMI 的底座，FrostADR Runtime 将承载检测、响应、审批和阻断能力。"
    case .privacyCenter:
      "用户应能检查、编辑、删除记忆，关闭学习，导出审计，并清空本地智能状态。"
    case .settings:
      "设置页会承载本地服务、模型 provider、工作区边界、隐私模式和 Prompt Copilot 开关。"
    case .agentSensing:
      "本页使用真实端上发现结果或真实空状态，不填充 mock 资产。"
    }
  }

  @MainActor
  @ViewBuilder
  var destination: some View {
    switch self {
    case .agentSensing:
      AgentScanView()
    default:
      FrostModulePlaceholderView(route: self)
    }
  }
}
