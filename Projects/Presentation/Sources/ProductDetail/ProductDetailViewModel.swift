//
//  ProductDetailViewModel.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import SwiftUI

import Domain

public class ProductDetailViewModelWithRouter: ProductDetailViewModel {
    private let router: NavigationRouter?
    
    public init(router: NavigationRouter? = nil,
         productDetailUseCase: ProductDetailUseCaseInterface? = nil,
         basketRequestUseCase: BasketRequestUseCaseInterface? = nil) {
        self.router = router
        super.init(productDetailUseCase: productDetailUseCase, basketRequestUseCase: basketRequestUseCase)
    }
    
    override func tapAddButton() {
        super.tapAddButton()
        router?.closeScreen()
    }
    
    override func addBasket() {
        super.addBasket()
        router?.closeScreen()
    }
}

public class ProductDetailViewModel: ObservableObject {
    private let productDetailUseCase: ProductDetailUseCaseInterface?
    private let basketRequestUseCase: BasketRequestUseCaseInterface?
    
    @Published var productDetailModel: ProductDetailModel?
    @Published var productDetailModelIsLoading: Bool = false
    @Published var sendBasketRequestIsLoading: Bool = false
    
    public init(productDetailUseCase: ProductDetailUseCaseInterface?,
                basketRequestUseCase: BasketRequestUseCaseInterface?) {
        self.productDetailUseCase = productDetailUseCase
        self.basketRequestUseCase = basketRequestUseCase
    }
    
    func fetchProductDetail(id: Int) {
        guard let productDetailUseCase else {
            productDetailModel = ProductDetailModelMapper.toProductDetailModel(entity: ProductDetail.sample)
            return
        }
        
        productDetailModelIsLoading = true
        
        Task {
            await productDetailUseCase.fetchProductDetail(id: id) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entity):
                        self.productDetailModel = ProductDetailModelMapper.toProductDetailModel(entity: entity)
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            productDetailModelIsLoading = false
        }
    }
    
    func sendBasketRequest(currentSpicyID: Int, currentOptions: [Int: Int], cnt: Int) {
        withAnimation(.smooth) {
            sendBasketRequestIsLoading = true
        }
        
        guard let productID = productDetailModel?.id else {
            return
        }
        
        guard let productPrice = productDetailModel?.price else {
            return
        }
        
        var spicy: BasketRequestProductModel.Spicy? {
            guard let spicy = productDetailModel?.spicy.first(where: { spicy in
                return spicy.id == currentSpicyID
            }) else {
                return nil
            }
            
            return .init(id: spicy.id, level: spicy.level, intro: spicy.intro)
        }
        
        var options: [BasketRequestProductModel.Option]? {
            guard let selectedOption = productDetailModel?.options.filter({ option in
                return currentOptions.contains { key, value in
                    return key == option.id && option.item.contains(where: { item in
                        return item.id == value
                    })
                }
            }) else {
                return nil
            }
            
            return selectedOption.map { option in
                return .init(id: option.id, name: option.name, selected: option.item.first?.name ?? "")
            }
        }
        
        Task {
            await basketRequestUseCase?.sendBasketRequest(product: BasketRequestProductModelMapper.toBasketRequestProduct(model: .init(id: productID, spicy: spicy, options: options)), cnt: cnt, price: productPrice * cnt) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        self.addBasket()
                        break
                    case .failure(let failure):
                        print("\(#function) -> \(failure)")
                    }
                }
            }
        }
        
        withAnimation(.smooth) {
            sendBasketRequestIsLoading = false
        }
    }
    
    func tapAddButton() {}
    func addBasket() {}
}
