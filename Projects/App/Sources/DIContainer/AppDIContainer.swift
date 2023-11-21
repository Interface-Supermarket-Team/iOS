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
    
    public func rootViewModelDependencies(router: NavigationRouter) -> RootViewModel {
        return RootViewModel(router: router)
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
        
        let basketDataSource = BasketDataSource()
        let basketRepository = BasketRepository(dataSource: basketDataSource)
        let basketUseCase = BasketUseCase(repository: basketRepository)
        
        return MainViewModelWithRouter(router: router,
                                       marketUseCase: marketUseCase,
                                       productUseCase: productUseCase,
                                       productCategoryUseCase: productCategoryUseCase,
                                       basketUseCase: basketUseCase)
    }
    
    public func productDetialViewModelDependencies(router: NavigationRouter) -> ProductDetailViewModel {
        let productDetailDataSource = ProductDetailDataSource()
        let productDetailRepository = ProductDetailRepository(dataSource: productDetailDataSource)
        let productDetailUseCase = ProductDetailUseCase(repository: productDetailRepository)
        
        let basketRequestDataSource = BasketRequestDataSource()
        let basketRequestRepository = BasketRequestRepository(dataSource: basketRequestDataSource)
        let basketRequestUseCase = BasketRequestUseCase(repository: basketRequestRepository)
        
        return ProductDetailViewModelWithRouter(router: router,
                                                productDetailUseCase: productDetailUseCase,
                                                basketRequestUseCase: basketRequestUseCase)
    }
}
    
