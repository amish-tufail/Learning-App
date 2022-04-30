//
//  ContentView.swift
//  Onboarding
//
//  Created by Meng To on 2021-04-09.
//

import SwiftUI
import SwiftUIX

struct On: View {
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            background
            
            TabView(selection: $selection) {
                CardView().tag(0)
                CardView().tag(1)
                CardView().tag(2)
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

struct On_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUIX
struct CardView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("120 hours of video".uppercased())
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
                    .mask(Text("Learn \ndesign \nand code")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading))
                Text("Learn by building real apps using Swift, React, Flutter and more. Design files and source code are included for each course.")
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
