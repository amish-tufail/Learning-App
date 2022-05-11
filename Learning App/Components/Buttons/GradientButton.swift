//
//  GradientButton.swift
//  Learning App
//
//  Created by Amish Tufail on 11/05/2022.
//

import SwiftUI

struct GradientButton: View {
    var buttonTitle: String
    var buttonAction: () -> Void
    var gradient1: [Color] = [
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1),
    ]
    @State private var angle: Double = 0
    
    var body: some View {
        Button(action: buttonAction, label: {
            GeometryReader { geometry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(angle))
                        .blendMode(.overlay)
                        .blur(radius: 8.0)
                        .mask(
                            RoundedRectangle(cornerRadius: 16)
                                .frame(maxWidth: geometry.size.width - 15)
                                .frame(height: 50)
                                .blur(radius: 8)
                        )
                        .onAppear {
                            withAnimation(.linear(duration: 7)) {
                                self.angle += 350
                            }
                        }
                    Text(buttonTitle)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                        .font(.headline)
                        .frame(maxWidth: geometry.size.width - 15)
                        .frame(height: 50)
                        .background(
                            Color("tertiaryBackground")
                                .opacity(0.9)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color.white, lineWidth: 1.0)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16.0)
                }
            }
            .frame(height: 50)
        })
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(buttonTitle: "hello") {
            print("yy")
        }
    }
}
