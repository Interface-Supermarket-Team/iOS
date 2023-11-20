//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 11/20/23.
//

import ProjectDescriptionHelpers
import ProjectDescription

let target = Target.makeAppTargets(
    name: "Shared",
    platform: .iOS,
    infoPlist: .default,
    product: .framework,
    dependencies: [
        .target(name: "ExternalLibraryTarget"),
        .target(name: "DesignSystem")
    ]
)

let externalLibraryTarget = Target.makeAppTargets(
    name: "ExternalLibraryTarget",
    platform: .iOS,
    infoPlist: .default,
    product: .framework,
    directoryName: "ExternalLibrary/",
    dependencies: []
)

let designSystemTarget = Target.makeAppTargets(
    name: "DesignSystem",
    platform: .iOS,
    infoPlist: .default,
    product: .framework,
    directoryName: "DesignSystem/",
    dependencies: []
)

let project = Project(name: "Shared", targets: [
    target,
    externalLibraryTarget,
    designSystemTarget
])
