//
//  CircularView.swift
//  Learning App
//
//  Created by Amish Tufail on 26/04/2022.
//

import SwiftUI

struct CircularView: View {
    var value: CGFloat = 0.2
    var lineWidth: Double = 4
    @State var appear = false
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0) // Trim the circle
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)) // Set the Stroke and its width with the style
            .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear {
                withAnimation(.spring().delay(0.5)) {
                    appear = true
                }
            }
            .onDisappear {
                appear = false
            }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}
