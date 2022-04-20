//
//  SignUpView.swift
//  Learning App
//
//  Created by Amish Tufail on 20/04/2022.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle)
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
            Button {} label: {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .controlSize(.large) // Button Size
        }
        .padding(20) // Internal Padding
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        .padding(20) // Outside Padding
        .background(
            Image("Blob 1")
                .offset(x: 200, y: -100)
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
