//
//  CertificateCardView.swift
//  Learning App
//
//  Created by Amish Tufail on 10/05/2022.
//

import SwiftUI
import AudioToolbox
import SwiftUIX

struct CertificateCardView: View {
    let generator = UISelectionFeedbackGenerator()
    @State var selection = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("background-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            TabView(selection: $selection) {
                ForEach(Array(featuredCourses.enumerated()), id: \.offset ) { index, course in
                    CertificationCard(course: course)
                        .padding(.horizontal, 8.0)
                        .tag(index)
                    
                }
            }

            .tabViewStyle(PageTabViewStyle())
            .frame(height: 750)
            Button {
                withAnimation {
                    dismiss()
                }
                generator.selectionChanged()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(6)
                    .background(VisualEffectBlurView(blurStyle: .systemThinMaterialDark))
                    .mask(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(20)
            .offset(y: -20)
        }
//        .background(AccountBackground())
    }
}

struct CertificateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCardView()
    }
}
