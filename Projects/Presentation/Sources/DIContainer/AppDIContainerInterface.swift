//
//  DIContainerInterface.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol AppDIContainerInterface {
    func navigationRouter() -> NavigationRouter
    func rootViewModelDependencies(router: NavigationRouter) -> RootViewModel
    func mainViewModelDependencies(router: NavigationRouter) -> MainViewModel
    func productDetialViewModelDependencies(router: NavigationRouter) -> ProductDetailViewModel
}
