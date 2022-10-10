// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RevenueCatWebhookEventSwift",
    products: [
        .library(
            name: "RevenueCatWebhookEventSwift",
            targets: ["RevenueCatWebhookEventSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RevenueCatWebhookEventSwift",
            dependencies: []),
        .testTarget(
            name: "RevenueCatWebhookEventSwiftTests",
            dependencies: ["RevenueCatWebhookEventSwift"]),
    ]
)
