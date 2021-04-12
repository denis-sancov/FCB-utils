// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FCB-utils",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FCB-utils",
            targets: ["FCB-utils"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "FCB-utils",
            resources: [
                .process("Currency/ISO-4217.plist")
            ]
        ),
    ]
)
