//
//  FAQView.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI
import AudioToolbox

struct FAQView: View {
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

            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation(Animation.easeIn, value: contentOffset)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ").font(.largeTitle)
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("FAQ")
                    .font(.title, weight: .bold)
                    .foregroundColor(.primary)
                ForEach(faqData, id: \.id) { faq in
                    FAQRow(faq: faq)
                }
                .padding(.bottom, 16)
                
                Text("Have any question?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .opacity(0.7)
                
                Link(destination: URL(string: "amish.tufail2002@gmail.com")!, label: {
                    SecondaryButton()
                        .padding(.top, 16)
                })
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
struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
