//
//  RootViewModel.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

public class RootViewModel: ObservableObject {
    private let router: NavigationRouter
    
    public init(router: NavigationRouter) {
        self.router = router
    }
    
    @ViewBuilder
    public func nextView() -> some View {
        router.nextTransitionScreen()
    }
}
