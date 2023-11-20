//
//  MainView.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

import DesignSystem

struct MainView: View {
    @StateObject private var viewModel: MainViewModel
    
    @State private var currentCategoryName: String = "전체"
    
    init(viewModel: MainViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                numberOfWaiting(number: 5)
                
                mainProductList
                
                searchButton
                
                categoryList
                
                productList
                
                Spacer()
            }
        }
        .background(Color.background)
        .overlay(alignment: .top) {
            GeometryReader { reader in
                ZStack(alignment: .top) {
                    navigationBackground
                    
                    if let marketModel = viewModel.marketModel, !viewModel.marketModelIsLoading {
                        title(name: marketModel.name, category: marketModel.category)
                    } else {
                        LoadingView()
                    }
                }
                .frame(height: reader.safeAreaInsets.top + 20)
            }
        }
        .onAppear {
            viewModel.fetchMarket(id: 1)
            viewModel.fetchMainProducts()
            viewModel.fetchProducts()
            viewModel.fetchCategories()
        }
    }
    
    private var navigationBackground: some View {
        BlurView(false, backgroundColor: .constant(.clear))
            .overlay {
                Color.white.opacity(0.8)
            }
            .mask(LinearGradient(colors: [
                .clear,
                .white,
                .white
            ], startPoint: .bottom, endPoint: .top))
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func title(name: String, category: String) -> some View {
        HStack(spacing: 8) {
            Text(name)
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            Text(category)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                }
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    private func numberOfWaiting(number: Int) -> some View {
        HStack {
            Text("현재 대기 인원")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .foregroundStyle(Color.graySub)
            
            Spacer()
            
            Text("\(number)팀")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 24)
        .background {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(.black)
        }
        .padding(.top, 65)
        .padding(.horizontal, 24)
        
    }
    
    private var mainProductList: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("주문이 많은 인기 메뉴를 도전해보세요!")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundStyle(Color.grayWhite)
                .padding(.horizontal, 24)
            
            Text("인기 메뉴")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.horizontal, 24)
            
            if let mainProducts = viewModel.mainProductModels, 
                !viewModel.mainProductModelsIsLoading {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(mainProducts) { mainProduct in
                            MainProductCellView(mainViewModel: viewModel, productModel: mainProduct)
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.top, 12)
                    .padding(.bottom, 24)
                }
            } else {
                LoadingView()
            }
        }
        .padding(.top, 32)
    }
    
    private var searchButton: some View {
        Button {
            
        } label: {
            HStack {
                Text("ex) 치킨, 꼬치")
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.graySub)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16)
                    .foregroundStyle(Color.grayWhite)
            }
            .padding(16)
            .background {
                RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.graySub)
                    }
            }
        }
        .padding(.horizontal, 24)
    }
    
    private var categoryList: some View {
        Group {
            if let productCategories = viewModel.productCategoryModels,
               (!viewModel.productCategoryModelsIsLoading && !viewModel.productModelsIsLoading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        categoryButton(name: "전체")
                        
                        ForEach(productCategories) { category in
                            categoryButton(name: category.name)
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                }
            } else {
                LoadingView()
            }
        }
    }
    
    @ViewBuilder
    private func categoryButton(name: String) -> some View {
        let isSelected = name == currentCategoryName
        
        Button {
            withAnimation(.smooth) {
                currentCategoryName = name
            }
            
            if name == "전체" {
                viewModel.fetchProducts()
            } else {
                viewModel.fetchProductsCategory(name: name)
            }
        } label: {
            Text(name)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(isSelected ? .white : Color.grayWhite)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 20.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(isSelected ? .black : .white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color.grayWhite)
                        }
                }
        }
    }
    
    private var productList: some View {
        let colunms = GridItem(.adaptive(minimum: 160, maximum: .infinity), spacing: nil, alignment: .top)
        
        return Group {
            if let products = viewModel.productModels,
               (!viewModel.productCategoryModelsIsLoading && !viewModel.productModelsIsLoading) {
                LazyVGrid(columns: [colunms], spacing: 16) {
                    ForEach(products) { product in
                        ProductCellView(mainViewModel: viewModel, productModel: product)
                    }
                }
            } else {
                LoadingView()
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    MainView(viewModel: MainViewModelWithRouter())
}
