import SwiftUI

enum FrostTheme {
  static let radius: CGFloat = 8
  static let compactRadius: CGFloat = 6
  static let accent = Color(red: 0.18, green: 0.58, blue: 0.72)
  static let sidebarBackground = Color(red: 0.055, green: 0.071, blue: 0.088)
  static let sidebarSelection = Color(red: 0.12, green: 0.19, blue: 0.23)
  static let sidebarText = Color.white.opacity(0.86)
  static let sidebarMutedText = Color.white.opacity(0.56)

  static var pageBackground: Color {
    Color(nsColor: .windowBackgroundColor)
  }

  static var cardBackground: Color {
    Color(nsColor: .controlBackgroundColor)
  }

  static var secondaryCardBackground: Color {
    Color(nsColor: .textBackgroundColor).opacity(0.72)
  }

  static var border: Color {
    Color.primary.opacity(0.10)
  }

  static var subtleBorder: Color {
    Color.primary.opacity(0.07)
  }

  static var mutedText: Color {
    Color.secondary
  }

  static var tableHeaderBackground: Color {
    Color.primary.opacity(0.035)
  }
}
