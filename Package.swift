// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "URLBuilder",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "URLBuilder", targets: ["URLBuilder"]),
    ],
    targets: [
        .target(name: "URLBuilder"),
        .testTarget(name: "URLBuilderTests", dependencies: ["URLBuilder"]),
    ]
)
