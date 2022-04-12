//
//  AnimatableFontModifier.swift
//  Learning App
//
//  Created by Amish Tufail on 12/04/2022.
//

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double // size gets in here
    var weight: Font.Weight = .regular
    var design : Font.Design = .default
    
    var animatableData: Double {
        get { size } // gets the size
        set { size = newValue } // sets the size
    }
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design)) // applies the required Result
    }
}

extension View {
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}
