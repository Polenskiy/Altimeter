// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scenes",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Scenes",
            targets: ["Scenes"]),
    ],
    dependencies: [
        .package(path: "../DI"),
        .package(path: "../Services")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Scenes",
            dependencies: [
                .byName(name: "DI"),
                .byName(name: "Services")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ScenesTests",
            dependencies: ["Scenes"]),
    ]
)
