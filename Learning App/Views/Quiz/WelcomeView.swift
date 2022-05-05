//
//  WelcomeView.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI
import SwiftUIX
import AudioToolbox

struct WelcomeView: View {
    let generator = UISelectionFeedbackGenerator()
    @EnvironmentObject var quizManager: ResultModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        Text("Quiz")
                            .font(.title, weight: .heavy)
                            .foregroundColor(.primary)
                        Text("Are you ready to test out your skills?")
                            .foregroundColor(.primary)
                            .fontWeight(.light)
                    }
                    NavigationLink {
                        TestView()
                    } label: {
                        PrimaryButton(text: "Let's go!")
                    }
                   
                }
                .frame(width: 350, height: 300)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .shadow(color: Color("Shadow").opacity(0.3), radius: 5.0, x: 0.0, y: 3.0)
                .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -150)
                )
            }
            .overlay {
                Button {
                    dismiss()
                    generator.selectionChanged()
                } label: {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundColor(.primary)
                        .padding(8)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(25)
                .ignoresSafeArea()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .preferredColorScheme(.light)
            
            
    }
}
