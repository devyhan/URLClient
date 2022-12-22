// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "URLClient",
    platforms: [
      .iOS(.v15), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "URLClient",
            targets: ["URLClient"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "URLClient",
            dependencies: []),
        .testTarget(
            name: "URLClientTests",
            dependencies: ["URLClient"]),
    ]
)
