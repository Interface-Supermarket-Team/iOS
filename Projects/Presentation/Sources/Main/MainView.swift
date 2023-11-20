//
//  MainView.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

import Domain

#Preview {
    MainView(viewModel: MainViewModelWithRouter())
}
