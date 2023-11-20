//
//  ScrollViewOffsetPreferenceKey.swift
//  DesignSystem
//
//  Created by 김도형 on 11/20/23.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
