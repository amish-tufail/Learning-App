//
//  OnboardingCard.swift
//  Learning App
//
//  Created by Amish Tufail on 30/04/2022.
//

import SwiftUI
import SwiftUIX

struct OnboardingCardView: View {
    var card: Card = cards[0]
    @AppStorage("selection") var selection = 0
    @Binding var showShoudlOnBoarding: Bool
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(card.time.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white.opacity(0.7))
                
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                        .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                            endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0))
                    .frame(maxHeight: 140)
                    .mask(Text(card.title)
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading))
                Text(card.text)
                    .font(.subheadline)
                    .foregroundColor(Color.white.opacity(0.8))
            }
            .padding(30)
            .background(LinearGradient(
                            gradient: Gradient(stops: [
                                                .init(color: Color(#colorLiteral(red: 0.14509804546833038, green: 0.12156862765550613, blue: 0.2549019753932953, alpha: 1)), location: 0),
                                                .init(color: Color(#colorLiteral(red: 0.14509804546833038, green: 0.12156862765550613, blue: 0.2549019753932953, alpha: 0)), location: 1)]),
                            startPoint: UnitPoint(x: 0.49999988837676157, y: 2.9497591284275417e-15),
                            endPoint: UnitPoint(x: 0.4999999443689973, y: 0.9363635917143408)))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.2), Color.white.opacity(0)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    .blendMode(.overlay)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.2), Color.white.opacity(0)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                            .blur(radius: 8)
                    )
            )
            .padding(20)
        }
        .overlay(
            Button {
                if selection < 3 {
                    selection = selection + 1
                }
                if selection == 3 {
                    showShoudlOnBoarding.toggle()
                    selection = 0
                }
            } label: {
                Text(card.button.uppercased())
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(
                        LinearGradient(
                                    gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                                .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                                    startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                                    endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0))
                    )
                    .padding(.horizontal, 10)
                    .padding(10)
                    .overlay(Capsule().stroke(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                    .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                        endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0)), lineWidth: 2) .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30))
                    .background(Capsule().stroke(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                    .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                        endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0)), lineWidth: 2).blur(radius: 3))
                    
            }
//            .controlSize(.small) // Button Size
            .offset(x: 0, y: 240)
        )
        .frame(height: 600)
        .background(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.15701383352279663, green: 0.10772569477558136, blue: 0.3541666567325592, alpha: 0)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.15701383352279663, green: 0.10772569477558136, blue: 0.3541666567325592, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: 0.10500000480115429),
                        endPoint: UnitPoint(x: 0.5, y: 1.0000000400096194)))
        .mask(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.2), Color.white.opacity(0.8)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                .blendMode(.overlay)
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.2), Color.white.opacity(0)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                        .blur(radius: 8)
                )
        )
        .background(
            VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .blur(radius: 30)
                .padding(.top, 80)
        )
        .padding(8)
    }
}


struct OnboardingCard_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(showShoudlOnBoarding: .constant(true))
    }
}
