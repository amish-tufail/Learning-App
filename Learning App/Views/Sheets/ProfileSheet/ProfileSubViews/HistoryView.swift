//
//  HistoryView.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI
import AudioToolbox

struct HistoryView: View {
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
        .navigationTitle("History").font(.largeTitle)
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 15) {
                Text("History")
                    .font(.title, weight: .bold)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("No History found")
                    .font(.footnote, weight: .semibold)
                    .opacity(0.7)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .padding(.top, 35)
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
            .offset(y: -20)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .preferredColorScheme(.dark)
    }
}
