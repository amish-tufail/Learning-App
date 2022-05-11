//
//  PrimaryButton.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color(.systemIndigo)
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        if colorScheme == .light {
            lightButton
        } else {
            darkButton
        }
    }
    
    var lightButton: some View {
        Text(text)
            .font(.caption.weight(.semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(10)
            .background(background)
            .cornerRadius(30)
            .shadow(color: Color("Shadow"), radius: 10, x: 0, y: 5)
    }
    
    var darkButton: some View {
        Text(text)
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
                endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0)), lineWidth: 2))
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
            
    }
}
