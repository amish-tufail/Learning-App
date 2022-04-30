//
//  Onboarding.swift
//  Learning App
//
//  Created by Amish Tufail on 30/04/2022.
//

import SwiftUI
import SwiftUIX

struct Onboarding: View {
    @Binding var shoudlShowOnboarding: Bool
    @AppStorage("selection") var selection = 0
    var body: some View {
        ZStack {
            background
            TabView(selection: $selection) {
                ForEach(Array(cards.enumerated()), id:\.offset) { index, card in
                    OnboardingCardView(card: card, showShoudlOnBoarding: $shoudlShowOnboarding)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            .background(
                ZStack {
                    FaceGraphic(selection: $selection)
                    Blob1Graphic(selection: $selection)
                    Blob2Graphic(selection: $selection)
                }
            )
        }
    }
    
    var background: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.8458333611488342, green: 0.39472222328186035, blue: 0.5841889381408691, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.28703832626342773, green: 0.11713546514511108, blue: 0.7208333611488342, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.5000000291053439, y: 1.0838161507153998e-8),
            endPoint: UnitPoint(x: -0.002089660354856915, y: 0.976613295904758))
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Wave()
                    Wave1()
                }
            )
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(shoudlShowOnboarding: .constant(true))
    }
}


//background
//TabView(selection: $selection) {
//    ForEach(Array(cards.enumerated()), id:\.offset) { index, card in
//        OnboardingCardView(card: card)
//            .tag(index)
//    }
//}
//.tabViewStyle(PageTabViewStyle())
//
//.background(
//    ZStack {
//        FaceGraphic(selection: $selection)
//        Blob1Graphic(selection: $selection)
//        Blob2Graphic(selection: $selection)
//    }
//)

