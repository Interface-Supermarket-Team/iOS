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
    
    public init(router: NavigationRouter? = nil, useCase: MarketUseCaseInterface? = nil) {
        self.router = router
        super.init(useCase: useCase)
    }
    
    override func tapProductButton() {
        super.tapProductButton()
        router?.triggerScreenTransition(route: .productDetail)
    }
}

public class MainViewModel: ObservableObject {
    private let useCase: MarketUseCaseInterface?
    
    @Published var marketModel: MarketModel?
    @Published var isLoading: Bool = false
    
    public init(useCase: MarketUseCaseInterface?) {
        self.useCase = useCase
    }
    
    func fetchMarket(id: Int) {
        guard let useCase else {
            marketModel = MarketModelMapper.toMarketModel(entity: Market.sample)
            return
        }
        
        isLoading = true
        
        Task {
            await useCase.fetchMarket(id: id) { [weak self] result in
                switch result {
                case .success(let entity):
                    self?.marketModel = MarketModelMapper.toMarketModel(entity: entity)
                case .failure(let failure):
                    print("\(#function) -> \(failure)")
                }
            }
        }
        
        withAnimation(.smooth) {
            isLoading = false
        }
    }
    
    func tapProductButton() {}
}
