//
//  OptionCellView.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import SwiftUI

struct OptionCellView: View {
    @Binding var currentOptions: [Int: Int]
    
    @State private var isSelected: Bool = false
    
    private let option: ProductDetailModel.Option
    
    init(currentOptions: Binding<[Int: Int]>, option: ProductDetailModel.Option) {
        self._currentOptions = currentOptions
        self.option = option
    }
    
    var body: some View {
        HStack {
            Text(option.name)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
            
            Spacer()
            
            optionItems
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
        }
    }
    
    private var optionItems: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .trailing, spacing: 16) {
                if let selectedItem = option.item.first(where: { $0.id == currentOptions[option.id]}) {
                    selectedItemButton(itemName: selectedItem.name)
                    
                    if isSelected {
                        ForEach(option.item.filter({ item in
                            return selectedItem.id != item.id
                        })) { item in
                            itemButton(item: item)
                        }
                    }
                }
            }
            
            Image(systemName: "chevron.down")
                .scaledToFit()
                .frame(width: 10)
                .foregroundStyle(Color.black)
                .rotationEffect(isSelected ? Angle(degrees: 180) : .zero)
        }
    }
    
    @ViewBuilder
    private func selectedItemButton(itemName: String) -> some View {
        Button {
            withAnimation(.snappy) {
                isSelected.toggle()
            }
        } label: {
            Text("\(itemName)")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
        }
    }
    
    @ViewBuilder
    private func itemButton(item: ProductDetailModel.Option.Item) -> some View {
        Button {
            withAnimation(.snappy) {
                currentOptions.updateValue(item.id, forKey: option.id)
                isSelected = false
            }
        } label: {
            Text("\(item.name)")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModelWithRouter(), productDetailID: 1)
}
