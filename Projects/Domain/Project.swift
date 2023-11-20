//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 11/20/23.
//

import ProjectDescriptionHelpers
import ProjectDescription

let target = Target.makeAppTargets(
    name: "Domain",
    platform: .iOS,
    infoPlist: .default,
    product: .framework,
    dependencies: [
        .project(target: "Shared", path: .relativeToRoot("Projects/Shared"))
    ]
)

let project = Project(name: "Domain", targets: [target])
