//
//  OrderViewModel.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import SwiftUI

import Domain

public class OrderViewModel: ObservableObject {
    private let basketUseCase: BasketUseCaseInterface?
    
    @Published var basketModel: BasketModel?
    @Published var fetchBasketIsLoading: Bool = false
    
    public init(basketUseCase: BasketUseCaseInterface?) {
        self.basketUseCase = basketUseCase
        self.basketModel = basketModel
    }
}
