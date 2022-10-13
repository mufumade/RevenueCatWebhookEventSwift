// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RevenueCatWebhookEventSwift",
    products: [
        .library(
            name: "RevenueCatWebhookEventSwift",
            targets: ["RevenueCatWebhookEventSwift"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Flight-School/AnyCodable",
            from: "0.6.0"
        )
    ],
    targets: [
        .target(
            name: "RevenueCatWebhookEventSwift",
            dependencies: [.byName(name: "AnyCodable")]),
        .testTarget(
            name: "RevenueCatWebhookEventSwiftTests",
            dependencies: ["RevenueCatWebhookEventSwift"]),
    ]
)

