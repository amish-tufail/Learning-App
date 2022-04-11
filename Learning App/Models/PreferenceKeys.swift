//
//  PreferenceKeys.swift
//  Learning App
//
//  Created by Amish Tufail on 11/04/2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
