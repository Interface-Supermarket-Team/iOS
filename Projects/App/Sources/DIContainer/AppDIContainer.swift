//
//  AppDIContainer.swift
//  ClickAndPickApp
//
//  Created by 김도형 on 11/20/23.
//  Copyright © 2023 SuperMarketTeam.com. All rights reserved.
//

import Foundation

import Presentation
import Data
import Domain

public final class AppDIContainer: AppDIContainerInterface {
    public func navigationRouter() -> Presentation.NavigationRouter {
        return NavigationRouter(diContainer: self)
    }
    
    public func mainViewModelDependencies(router: NavigationRouter) -> MainViewModel {
        let marketDataSource = MarketDataSource()
        let marketRepository = MarketRepository(dataSource: marketDataSource)
        let marketUseCase = MarketUseCase(repository: marketRepository)
        
        let productDataSource = ProductDataSource()
        let productRepository = ProductRepository(dataSource: productDataSource)
        let productUseCase = ProductUseCase(repository: productRepository)
        
        let productCategoryDataSource = ProductCategoryDataSource()
        let productCategoryRepository = ProductCategoryRepository(dataSource: productCategoryDataSource)
        let productCategoryUseCase = ProductCategoryUseCase(repository: productCategoryRepository)
        
        return MainViewModelWithRouter(router: router,
                                       marketUseCase: marketUseCase,
                                       productUseCase: productUseCase,
                                       productCategoryUseCase: productCategoryUseCase)
    }
    
    public func rootViewModelDependencies(router: NavigationRouter) -> RootViewModel {
        return RootViewModel(router: router)
    }
}
    
