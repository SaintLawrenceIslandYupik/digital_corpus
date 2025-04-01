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
                path: "ess/early_readers/ess_content",
                sources: nil,
                resources: [.process("01_Sallghet.ess_content")],
                publicHeadersPath: ""
               )
    ]
)

