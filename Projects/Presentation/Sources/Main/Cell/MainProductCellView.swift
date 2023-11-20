//
//  MainProductCellView.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import SwiftUI

struct MainProductCellView: View {
    @ObservedObject private var mainViewModel: MainViewModel
    
    private let productModel: ProductModel
    
    init(mainViewModel: MainViewModel, productModel: ProductModel) {
        self.mainViewModel = mainViewModel
        self.productModel = productModel
    }
    
    var body: some View {
        Button {
            mainViewModel.tapMainProductButton(name: productModel.name)
        } label: {
            ZStack(alignment: .bottomLeading) {
                productImage
                
                title
            }
        }
    }
    
    private var productImage: some View {
        Group {
            if let url = URL(string: productModel.image ?? "https://raw.githubusercontent.com/Interface-Supermarket-Team/backend/main/null.png") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    LoadingView()
                }
                .overlay {
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0), location: 0.00),
                            Gradient.Stop(color: .black, location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                }
                .frame(width: 220, height: 300)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            } else {
                LoadingView()
            }
        }
        .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 1)
    }
    
    private var title: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(productModel.intro)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.graySub)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                
                Spacer()
            }
            .frame(maxWidth: 120)
            
            Text(productModel.name)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
        }
        .padding(16)
    }
}

#Preview {
    MainView(viewModel: MainViewModelWithRouter())
}
