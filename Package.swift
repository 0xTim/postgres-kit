// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "postgres-kit",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "PostgresKit", targets: ["PostgresKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/0xTim/postgres-nio", from: "1.4.0"),
        .package(url: "https://github.com/0xTim/sql-kit", from: "3.5.0"),
        .package(url: "https://github.com/0xTim/async-kit", from: "1.0.0"),
    ],
    targets: [
        .target(name: "PostgresKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "PostgresNIO", package: "postgres-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
        ]),
        .testTarget(name: "PostgresKitTests", dependencies: [
            .target(name: "PostgresKit"),
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
        ]),
    ]
)
