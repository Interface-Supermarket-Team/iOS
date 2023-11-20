//
//  tmp.swift
//  DesignSystem
//
//  Created by 김도형 on 11/6/23.
//

import SwiftUI
import Presentation

@main
struct ClickAndPickApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView(diContainer: AppDIContainer())
        }
    }
}

#Preview {
    RootView(diContainer: AppDIContainer())
}
