//
//  PackagesView.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI
import AudioToolbox

struct PackagesView: View {
    let generator = UISelectionFeedbackGenerator()
    @State private var contentOffset = CGFloat(0)
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(offsetChanged: { offsetPoint in
                contentOffset = offsetPoint.y
            }) {
                content
            }
            
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation(Animation.easeIn, value: contentOffset)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("SwiftUI Packages").font(.largeTitle)
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }

    var content: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("This app was 100% made using SwiftUI. We’d like to thank these amazing Swift Packages for making our lives as creators easier.")
                    .font(.subheadline)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment:. leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                ForEach(packagesData, id: \.id) { package in
                    PackageRow(package: package)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 45)
            Button {
                dismiss()
                generator.selectionChanged()
            } label: {
                Image(systemName: "arrow.backward")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .offset(y: -25)
        }
    }
}

struct PackagesView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesView()
    }
}
