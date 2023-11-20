import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Target {
    public static func makeAppTargets(name: String, platform: Platform, infoPlist: InfoPlist?, product: Product, entitlements: Entitlements? = nil, directoryName: String? = nil, dependencies: [TargetDependency]) -> Target {
        let platform: Platform = platform
        
        var settings: Settings {
            let base = SettingsDictionary().otherLinkerFlags(["-ObjC"])
            
            return .settings(base: base, configurations: [.debug(name: .debug), .release(name: .release)])
        }
        
        let target = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "com.SuperMarketTeam.\(name)",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad], supportsMacDesignedForIOS: true),
            infoPlist: infoPlist,
            sources: ["\(directoryName ?? "")Sources/**"],
            resources: ["\(directoryName ?? "")Resources/**"],
            entitlements: entitlements,
            dependencies: dependencies,
            settings: settings
        )
        
        return target
    }
}
