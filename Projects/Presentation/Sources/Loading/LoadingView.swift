//
//  LoadingView.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
                    .tint(.black)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
