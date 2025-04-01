// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "digital_corpus",
    products: [
        .library(name: "digital_corpus",
                 targets: ["EarlyReaders"]),
    ],
    targets: [
        .target(name: "EarlyReaders",
                path: "ess",
                sources: nil,
                resources: [.process("early_readers")],
                publicHeadersPath: ""
               )
    ]
)

