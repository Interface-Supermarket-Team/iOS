//
//  NavigationRouter.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

import Domain

public final class NavigationRouter: ObservableObject {
    public let id = UUID()
    
    public init(diContainer: AppDIContainerInterface) {
        self.diContainer = diContainer
    }
    
    @Published public var navigationPath: NavigationPath = .init()
    
    public var nextTransitionRoute: PushRoute = .main
    
    private let diContainer: AppDIContainerInterface
    
    public func triggerScreenTransition(route: PushRoute) {
        navigationPath.append(route)
        nextTransitionRoute = route
    }
    
    public func nextTransitionScreen() -> some View {
        nextTransitionRoute.nextView(diContainer: self.diContainer, router: self)
    }
}

public extension NavigationRouter {
    enum PushRoute: Hashable {
        case main
        case productDetail
       
        @ViewBuilder
        func nextView(diContainer: AppDIContainerInterface, router: NavigationRouter) -> some View {
            switch self {
            case .main:
                MainView(viewModel: diContainer.mainViewModelDependencies(router: router))
            case .productDetail:
                EmptyView()
            }
        }
    }
}
