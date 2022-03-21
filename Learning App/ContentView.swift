//
//  ContentView.swift
//  Learning App
//
//  Created by Amish Tufail on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer() // pushed everything to bottom from image to mutlitext
            Image("Logo 2")
                .resizable(resizingMode: .stretch) // from inspector
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text("Build and iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading) // from inspector
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading) // infinity = max possible space occupied
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0) // padding inside the card top and bottom
        .frame(height: 350.0)
        .background(.ultraThinMaterial) // using instead of Color("Background")
        .cornerRadius(30.0)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10.0, x: 0.0, y: 10.0)
        .padding(.horizontal, 20.0) // padding on the outer horizontal
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
            
                
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
