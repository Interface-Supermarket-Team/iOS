//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 11/20/23.
//

import ProjectDescriptionHelpers
import ProjectDescription

let target = Target.makeAppTargets(
    name: "Presentation",
    platform: .iOS,
    infoPlist: .default,
    product: .framework,
    dependencies: [
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain"))
    ]
)

let project = Project(name: "Presentation", targets: [target])
