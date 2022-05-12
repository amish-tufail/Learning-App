//
//  Extensions.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI

extension View {
    func blurBackground() -> some View {
        self.padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(0.0)))
            .mask(self)
    }
    func linearGradientBackground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return dateFormatter.string(from: self)
    }
}

//extension View {
//    func spotlight(enabled: Bool, title: String = " ") -> some View {
//        return self
//            .overlay {
//                if enabled {
//                    SpotlightView(title: title) {
//                        self
//                    }
//                }
//            }
//    }
//}
//
//struct OnboardingCard_SpotLight_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingCardView(showShoudlOnBoarding: .constant(true))
//    }
//}
//
//struct SpotlightView<Content: View>: View {
//    var content: Content
//    var title: String
//    init(title: String, @ViewBuilder content: @escaping ()->Content) {
//        self.content = content()
//        self.title = title
//    }
//    var body: some View {
//        Rectangle()
//            .fill(.red)
//    }
//}

