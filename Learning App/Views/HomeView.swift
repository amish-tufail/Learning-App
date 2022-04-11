//
//  HomeView.swift
//  Learning App
//
//  Created by Amish Tufail on 11/04/2022.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll") // to make the coordinates according to the scroll
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
//                .opacity(hasScrolled ? 1 : 0) // as it is on nav bar as a whole so it dissappears
        )
    }
} 

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
