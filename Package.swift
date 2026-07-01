// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "FrostMacIntelligence",
  platforms: [
    .macOS(.v14)
  ],
  products: [
    .executable(name: "FrostMI", targets: ["FrostMI"])
  ],
  targets: [
    .executableTarget(
      name: "FrostMI",
      path: "Sources/FrostMI",
      resources: [
        .process("Discovery/Fingerprints")
      ]
    )
  ]
)
