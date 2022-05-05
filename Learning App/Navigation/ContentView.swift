//
//  ContentView.swift
//  Learning App
//
//  Created by Amish Tufail on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldShowOnboarding") var shoudlShowOnboarding: Bool = true // Changed from State to AppStorage to view it only once
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false // To connect Modal to the nav bar
    @EnvironmentObject var model: Model
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                ExploreView()
            case .notifications:
                NotficationsView()
            case .library:
                LibraryView ()
            }
            // Both methods are ok
//            if !model.showDetail {
//                TabBar()
//            }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            if showModal {
                ModalView()
                    .zIndex(1)
                    .accessibilityAddTraits(.isModal) // For voiceover
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 88)
        }
        .dynamicTypeSize(.large ... .xxLarge) // Applies to all the views
        .fullScreenCover(isPresented: $shoudlShowOnboarding) {
            Onboarding(shoudlShowOnboarding: $shoudlShowOnboarding)
                .statusBar(hidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(Model())
        
    }
} 
