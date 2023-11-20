//
//  MainViewModel.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

import Domain

public class MainViewModelWithRouter: MainViewModel {
    private let router: NavigationRouter?
    
    public init(router: NavigationRouter? = nil,
                marketUseCase: MarketUseCaseInterface? = nil,
                productUseCase: ProductUseCaseInterface? = nil,
                productCategoryUseCase: ProductCategoryUseCaseInterface? = nil
    ) {
        self.router = router
        super.init(marketUseCase: marketUseCase, 
                   productUseCase: productUseCase,
                   productCategoryUseCase: productCategoryUseCase)
    }
    
    override func tapMainProductButton(name: String) {
        super.tapMainProductButton(name: name)
        router?.triggerScreenTransition(route: .productDetail(name))
    }
    
    override func tapProductButton(name: String) {
        super.tapProductButton(name: name)
        router?.triggerScreenTransition(route: .productDetail(name))
    }
}

public class MainViewModel: ObservableObject {
    private let marketUseCase: MarketUseCaseInterface?
    private let productUseCase: ProductUseCaseInterface?
    private let productCategoryUseCase: ProductCategoryUseCaseInterface?
    
    @Published var marketModel: MarketModel?
    @Published var marketModelIsLoading: Bool = false
    @Published var productModels: [ProductModel]?
    @Published var productModelsIsLoading: Bool = false
    @Published var mainProductModels: [ProductModel]?
    @Published var mainProductModelsIsLoading: Bool = false
    @Published var productCategoryModels: [ProductCategoryModel]?
    @Published var productCategoryModelsIsLoading: Bool = false
    
    public init(marketUseCase: MarketUseCaseInterface?, 
                productUseCase: ProductUseCaseInterface?,
                productCategoryUseCase: ProductCategoryUseCaseInterface?) {
        self.marketUseCase = marketUseCase
        self.productUseCase = productUseCase
        self.productCategoryUseCase = productCategoryUseCase
    }
    
    func fetchMarket(id: Int) {
        guard let marketUseCase else {
            marketModel = MarketModelMapper.toMarketModel(entity: Market.sample)
            return
        }
        
        marketModelIsLoading = true
        
        Task {
            await marketUseCase.fetchMarket(id: id) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self?.marketModel = MarketModelMapper.toMarketModel(entity: entity)
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            marketModelIsLoading = false
        }
    }
    
    func fetchProducts() {
        guard let productUseCase else {
            productModels = Product.samples.map { product in
                return ProductModelMapper.toProductModels(entity: product)
            }
            return
        }
        
        productModelsIsLoading = true
        
        Task {
            await productUseCase.fetchProducts { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self?.productModels = entity.map { product in
                            return ProductModelMapper.toProductModels(entity: product)
                        }
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            productModelsIsLoading = false
        }
    }
    
    func fetchMainProducts() {
        guard let productUseCase else {
            mainProductModels = Product.samples.map { product in
                return ProductModelMapper.toProductModels(entity: product)
            }
            
            return
        }
        
        mainProductModelsIsLoading = true
        
        Task {
            await productUseCase.fetchMainProducts { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self?.mainProductModels = entity.map { product in
                            return ProductModelMapper.toProductModels(entity: product)
                        }
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            mainProductModelsIsLoading = false
        }
    }
    
    func fetchCategories() {
        guard let productCategoryUseCase else {
            productCategoryModels = ProductCategory.samples.map { category in
                return ProductCategoryModelMapper.toProductCategoryModel(entity: category)
            }
            
            return
        }
        
        productCategoryModelsIsLoading = true
        
        Task {
            await productCategoryUseCase.fetchCategories { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self?.productCategoryModels = entity.map { category in
                            return ProductCategoryModelMapper.toProductCategoryModel(entity: category)
                        }
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            productCategoryModelsIsLoading = false
        }
    }
    
    func fetchProductsCategory(name: String) {
        guard let productUseCase else {
            productModels = Product.samples.map { product in
                return ProductModelMapper.toProductModels(entity: product)
            }
            return
        }
        
        productModelsIsLoading = true
        
        Task {
            await productUseCase.fetchProductsCategory(name: name) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self?.productModels = entity.map { product in
                            return ProductModelMapper.toProductModels(entity: product)
                        }
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            productModelsIsLoading = false
        }
    }
    
    func tapMainProductButton(name: String) {}
    
    func tapProductButton(name: String) {}
}
