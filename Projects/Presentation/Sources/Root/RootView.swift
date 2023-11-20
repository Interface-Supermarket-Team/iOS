//
//  RootView.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

public struct RootView: View {
    @StateObject private var router: NavigationRouter
    @StateObject private var viewModel: RootViewModel
    
    private let mainView: MainView
    
    public init(diContainer: AppDIContainerInterface) {
        let router = diContainer.navigationRouter()
        
        self._router = .init(wrappedValue: router)
        self._viewModel = .init(wrappedValue: diContainer.rootViewModelDependencies(router: router))
        
        self.mainView = .init(viewModel: diContainer.mainViewModelDependencies(router: router))
    }
    
    public var body: some View {
        NavigationStack(path: $router.navigationPath) {
            mainView
                .navigationDestination(for: NavigationRouter.PushRoute.self) { _ in
                    viewModel.nextView()
                }
        }
    }
}
