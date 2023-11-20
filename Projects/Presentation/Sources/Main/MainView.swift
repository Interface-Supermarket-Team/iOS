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
    
    init(viewModel: MainViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                numberOfWaiting(number: 5)
            }
            .padding(.horizontal, 24)
        }
        .background(Color.background)
        .overlay(alignment: .top) {
            GeometryReader { reader in
                ZStack(alignment: .top) {
                    navigationBackground
                    
                    if let marketModel = viewModel.marketModel {
                        title(name: marketModel.name, category: marketModel.category)
                    }
                }
                .frame(height: reader.safeAreaInsets.top + 20)
            }
        }
        .onAppear {
            viewModel.fetchMarket(id: 1)
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
        
    }
}

import Domain

#Preview {
    MainView(viewModel: MainViewModelWithRouter())
}
