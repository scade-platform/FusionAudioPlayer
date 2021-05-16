// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "FusionAudioPlayer",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "FusionAudioPlayer",
            type: .static,
            targets: [
                "FusionAudioPlayer"
            ]
        )
    ],
    dependencies: [
      .package(name: "FusionMedia", url: "https://github.com/scade-platform/FusionMedia.git", .branch("feature/update_player")),
      .package(name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "FusionAudioPlayer",
            dependencies: [
            	.product(name: "FusionMedia", package: "FusionMedia"),
            	.product(name: "ScadeExtensions", package: "ScadeExtensions")
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)