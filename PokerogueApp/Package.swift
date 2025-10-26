// Package.swift
// Swift Package Manager용 빌드 파일
import PackageDescription

let package = Package(
    name: "PokerogueApp",
    platforms: [.iOS(.v15)],
    products: [.iOSApplication(name: "PokerogueApp",
                               targets: ["PokerogueApp"],
                               bundleIdentifier: "com.yourname.pokerogue",
                               teamIdentifier: nil,
                               displayVersion: "1.0",
                               bundleVersion: "1",
                               iconAssetName: "AppIcon",
                               accentColorAssetName: "AccentColor",
                               supportedDeviceFamilies: [.pad, .phone],
                               supportedInterfaceOrientations: [.landscapeRight],
                               capabilities: [] )],
    targets: [
        .executableTarget(
            name: "PokerogueApp",
            path: ".")
    ]
)
