// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "CineVerseNetworkFramework",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "CineVerseNetworkFramework",
            targets: ["CineVerseNetworkFramework"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .binaryTarget(
            name: "CineVerseNetworkFramework",
            path: "CineVerseNetworkFramework.xcframework"
        )
    ]
)
