//
//  FinishView.swift
//  Learning App
//
//  Created by Amish Tufail on 05/05/2022.
//

import SwiftUI
import AudioToolbox

struct FinishView: View {
    @State var showSection = false
    let generator = UISelectionFeedbackGenerator()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack(spacing: 12) {
                Image("Blob 2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                Text("Almost There!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text("You socred 1 out of 10. To earn a certficate, you must get over 80% marks.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                PrimaryButton(text: "Take the test Again".uppercased()
                )
            }
            .offset(y: -110)
            Button {
                withAnimation {
                    dismiss()
                    generator.selectionChanged()
                }
            } label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.primary)
                    .frame(width: 26.0, height: 26.0)
                    .cornerRadius(10.0)
                    .padding(9.0) // this padding and the below modifer gives a round outer to the image
                    .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .strokeStyle(cornerRadius: 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
        
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
            .preferredColorScheme(.dark)
    }
}
