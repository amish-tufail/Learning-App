//
//  NavigationBar.swift
//  Learning App
//
//  Created by Amish Tufail on 11/04/2022.
//

import SwiftUI
import AudioToolbox

struct NavigationBar: View {
    let generator = UISelectionFeedbackGenerator()
    var title = ""
    @Binding var hasScrolled: Bool
    @State var showSearch = false // To show the search view on click
    @State var showAccount = false // To show the Account view on click
    @AppStorage("showModal") var showModal = false // To connect Modal to the nav bar
    @AppStorage("isLogged") var isLogged = false
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            Text(title)
//                .font(.largeTitle.weight(.bold))
                .modifier(AnimatableFontModifier(size: hasScrolled ? 22 : 34, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0) // To move the title a little bit up when scrolled
            HStack(spacing: 16) {
                Button {
                    showSearch = true
                    generator.selectionChanged()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                }
                .sheet(isPresented: $showSearch) { // to open search view 
                    SearchView()
                }
                Button {
                    if isLogged {
                        showAccount = true
                        generator.selectionChanged()
                    } else {
                        withAnimation {
                            showModal = true
                            generator.selectionChanged()
                        }
                    }
                } label: {
                    AvatarView()
                }
                .accessibilityElement() // Forcing to use it for voiceover
                .accessibilityLabel("Account") // To have a accessible name
                .accessibilityAddTraits(.isButton) // To make it think it is a button
                .fullScreenCover(isPresented: $showAccount) { // to show Account View on click
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0) // to move the buttons a little bit up when scrolled
        }
        .frame(height: hasScrolled ? 44 : 70) // height of background
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured", hasScrolled: .constant(false))
    }
}
