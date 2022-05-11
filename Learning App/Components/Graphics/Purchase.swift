//
//  Purchase.swift
//  Learning App
//
//  Created by Amish Tufail on 11/05/2022.
//

import SwiftUI
import AudioToolbox
import SwiftUIX

struct Purchase: View {
    let generator = UISelectionFeedbackGenerator()
    let vibration = UINotificationFeedbackGenerator() // For Alert Haptics
    @AppStorage("showAlertView") var showAlertView: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State var appear = false
    var body: some View {
        ZStack {
            Color.clear.background(.ultraThinMaterial).ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "purchased.circle.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.systemBlue.opacity(0.7))
                
                Text("Purchased")
                    .foregroundColor(.primary)
                    .font(.title2, weight: .bold)
                VStack(spacing: 30) {
                    Text("You have successfully purchased Lifetime Pro Plan.")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                    GradientButton(buttonTitle: "Continue") {
                        showAlertView = false
                    }
                    .font(.headline)
                    .tint(.blue)
                    .controlSize(.large)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                }
            }
            .padding()
            .padding()
            .background(Color("secondaryBackground").opacity(0.5))
            .background(VisualEffectBlur(blurStyle: .dark))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .padding()
            .offset(y: 280)
            .opacity(appear ? 1 : 0)
            .offset(y: appear ? 0 : 560)
            .onAppear {
                withAnimation(.easeOut) {
                    appear = true
                }
                vibration.notificationOccurred(.success)
            }
        }
        .colorScheme(.dark)
    }
}

struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        Purchase()
    }
}
