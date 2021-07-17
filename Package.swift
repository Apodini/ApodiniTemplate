// swift-tools-version:5.4

import PackageDescription


let package = Package(
    name: "ApodiniTemplate",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(
            name: "WebService",
            targets: ["WebService"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .executableTarget(
            name: "WebService",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini")
            ]
        ),
        .testTarget(
            name: "WebServiceTests",
            dependencies: ["WebService"]
        )
    ]
)
