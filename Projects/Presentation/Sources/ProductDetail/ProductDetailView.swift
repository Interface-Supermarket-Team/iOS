//
//  ProductDetailView.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Namespace private var heroEffect
    
    @StateObject private var viewModel: ProductDetailViewModel
    
    @State private var contentOffsetY: CGFloat = 294
    @State private var productDetailQauntity: Int = 1
    @State private var currentSpicyID: Int = 1
    @State private var currentOptions: [Int: Int] = [:]
    @State private var showMoreDetail: Bool = false
    
    private let productDetailID: Int
    
    init(viewModel: ProductDetailViewModel, productDetailID: Int) {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        barAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        barAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().compactAppearance = barAppearance
        
        self._viewModel = .init(wrappedValue: viewModel)
        self.productDetailID = productDetailID
    }
    
    var body: some View {
        GeometryReader { reader in
            Group {
                if let productDetial = viewModel.productDetailModel, !viewModel.productDetailModelIsLoading {
                    content(productDetail: productDetial)
                        .background(alignment: .top) {
                            backgroundImage(width: reader.size.width)
                                .ignoresSafeArea()
                        }
                        .onAppear {
                            productDetial.options.forEach({ option in
                                currentOptions.updateValue(1, forKey: option.id)
                            })
                        }
                        .overlay(alignment: .bottom) {
                            addBasketButton
                        }
                } else {
                    LoadingView()
                }
            }
            .onAppear {
                viewModel.fetchProductDetail(id: productDetailID)
            }
        }
    }
    
    @ViewBuilder
    private func backgroundImage(width: CGFloat) -> some View {
        let imageWidth = (contentOffsetY - 294) > 0 ? (width + (contentOffsetY - 294)) : width
        AsyncImage(url: URL(string: viewModel.productDetailModel?.image ??
                            "https://raw.githubusercontent.com/Interface-Supermarket-Team/backend/main/null.png")) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            LoadingView()
        }
        .frame(width: imageWidth, height: 308)
        .overlay {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 1),
                endPoint: UnitPoint(x: 0.5, y: 0)
            )
        }
    }
    
    @ViewBuilder
    private func content(productDetail: ProductDetailModel) -> some View {
        GeometryReader { reader in
            VStack(spacing: 0) {
                titleAndPrice(name: productDetail.name,
                              intro: productDetail.intro,
                              price: productDetail.price)
                
                Divider()
                    .padding(.horizontal, 16)
                
                ScrollView {
                    VStack(spacing: 0) {
                        quantity
                            .padding(.horizontal, 24)
                        
                        if !productDetail.spicy.isEmpty {
                            spicy(productDetail: productDetail)
                                .padding(.horizontal, 24)
                        }
                        
                        optionList(productDetail: productDetail)
                            .padding(.horizontal, 24)
                    }
                    .padding(.bottom, 200)
                }
                .scrollDisabled(!showMoreDetail)
            }
            .background(Color.background)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .gesture(
                DragGesture()
                    .onChanged({ drag in
                        let height = drag.translation.height
                        
                        if contentOffsetY >= reader.safeAreaInsets.top {
                            contentOffsetY += (contentOffsetY >= 294) ? height / 100 : height
                            print(contentOffsetY)
                        } else {
                            contentOffsetY += height / 400
                        }
                    })
                    .onEnded({ drag in
                        if contentOffsetY < reader.safeAreaInsets.top + 80 {
                            withAnimation(.snappy) {
                                contentOffsetY = reader.safeAreaInsets.top
                            }
                            showMoreDetail = true
                        } else if drag.translation.height <= -20 {
                            withAnimation(.snappy) {
                                contentOffsetY = reader.safeAreaInsets.top
                            }
                            showMoreDetail = true
                        } else {
                            withAnimation(.snappy) {
                                contentOffsetY = 294
                            }
                            showMoreDetail = false
                        }
                    })
            )
            .offset(y: contentOffsetY)
        }
    }
    
    @ViewBuilder
    private func titleAndPrice(name: String, intro: String, price: Int) -> some View {
        VStack(spacing: 0) {
            Text(name)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 8)
                .padding(.top, 28)
            
            Text(intro)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .padding(.bottom, 16)
            
            Text("\(price)원")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.bottom, 64)
        }
    }
    
    private var quantity: some View {
        HStack(spacing: 42) {
            Text("수량")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
            
            Spacer()
            
            quantityButton(imageName: "minus") {
                withAnimation(.smooth) {
                    productDetailQauntity -= (productDetailQauntity == 1) ? 0 : 1
                }
            }
            
            Text("\(productDetailQauntity)")
                .font(.system(size: 22))
                .fontWeight(.medium)
            
            quantityButton(imageName: "plus") {
                withAnimation(.smooth) {
                    productDetailQauntity += 1
                }
            }
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 1)
        }
        .padding(.top, 24)
    }
    
    @ViewBuilder
    private func quantityButton(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(8)
                .background {
                    Circle()
                        .fill(.black)
                        .frame(width: 26, height:  26)
                }
        }
    }
    
    @ViewBuilder
    private func spicy(productDetail: ProductDetailModel) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("매운맛")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
            
            HStack(spacing: 0) {
                ForEach(productDetail.spicy) { spicy in
                    spicyButton(id: spicy.id, level: spicy.level, intro: spicy.intro)
                        .background {
                            HStack {
                                Spacer()
                                
                                Divider()
                            }
                        }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .clipped()
            .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 1)
        }
        .padding(.top, 24)
    }
    
    @ViewBuilder
    private func spicyButton(id: Int, level: String, intro: String) -> some View {
        let isSelected = currentSpicyID == id
        
        Button {
            withAnimation(.snappy) {
                currentSpicyID = id
            }
        } label: {
            HStack {
                Spacer()
                
                VStack(spacing: 8) {
                    Text(level)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundStyle(isSelected ? Color.white : Color.grayWhite)
                    
                    Text(intro)
                        .font(.system(size: 11))
                        .fontWeight(.medium)
                        .foregroundStyle(Color.graySub)
                }
                
                Spacer()
            }
            .padding(.vertical, 20)
            .background {
                if isSelected {
                    Color.black
                        .matchedGeometryEffect(id: "SPICYSELECTED", in: heroEffect)
                } else {
                    Color.clear
                }
            }
        }
    }
    
    @ViewBuilder
    private func optionList(productDetail: ProductDetailModel) -> some View {
        VStack(spacing: 24) {
            ForEach(productDetail.options) { option in
                OptionCellView(currentOptions: $currentOptions, option: option)
            }
        }
        .padding(.top, 32)
    }
    
    private var addBasketButton: some View {
        Button {
            viewModel.sendBasketRequest(currentSpicyID: currentSpicyID, currentOptions: currentOptions, cnt: productDetailQauntity)
        } label: {
            HStack {
                Spacer()
                
                Text("주문 담기")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                Spacer()
            }
            .padding(.vertical, 20)
            .background {
                RoundedRectangle(cornerRadius: 18, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(Color.black)
            }
        }
        .padding(.horizontal, 24)
        .background {
            BlurView(false, backgroundColor: .constant(.clear))
                .overlay {
                    Color.white.opacity(0.8)
                }
                .mask(LinearGradient(colors: [
                    .clear,
                    .white
                ], startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModelWithRouter(), productDetailID: 1)
}
