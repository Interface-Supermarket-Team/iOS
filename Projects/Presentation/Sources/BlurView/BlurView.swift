//
//  BlurView.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    @Binding var backgroundColor: Color
    
    private var strongBlur: Bool = false
    
    init(_ strongBlur: Bool = false, backgroundColor: Binding<Color>) {
        self.strongBlur = strongBlur
        self._backgroundColor = backgroundColor
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: strongBlur ? .systemThickMaterial : .systemUltraThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        gaussianBlurFilter(uiView)
    }
    
    func gaussianBlurFilter(_ uiView: UIVisualEffectView) {
        uiView.backgroundColor = UIColor(backgroundColor)
        
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first {
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
}
