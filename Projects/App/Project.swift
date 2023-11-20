//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 11/20/23.
//

import ProjectDescriptionHelpers
import ProjectDescription

let infoPlist: [String: Plist.Value] = [
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "CFBundleDevelopmentRegion" : "ko",
            "CFBundleLocalizations" : ["ko"],
            "ITSAppUsesNonExemptEncryption" : false,
            "CFBundleDisplayName" : "",
            "NSAppTransportSecurity" : [
                "NSAllowsArbitraryLoads" : true
            ]
]

let target = Target.makeAppTargets(
    name: "ClickAndPickApp",
    platform: .iOS,
    infoPlist: .extendingDefault(with: infoPlist),
    product: .app,
    dependencies: [
        .project(target: "Presentation", path: .relativeToRoot("Projects/Presentation")),
        .project(target: "Data", path: .relativeToRoot("Projects/Data"))
    ]
)

let project = Project(name: "ClickAndPick",
                      organizationName: "SuperMarketTeam.com",
                      packages: [],
                      targets: [target])
