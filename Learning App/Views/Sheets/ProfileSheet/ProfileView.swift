//
//  ProfileView.swift
//  Learning App
//
//  Created by Amish Tufail on 07/05/2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var contentOffset = CGFloat(0)
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offset in
                    contentOffset = offset.y
                    print("contentOffset", contentOffset)
                })
                {
                    content
                }
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(Animation.easeIn, value: contentOffset)
                    .ignoresSafeArea()
                    .frame(height: 0)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // For iPad
    }
    
    var content: some View {
        VStack {
            VStack {
                NavigationLink {
                    FAQView()
                } label: {
                    MenuRow()
                }
                divider
                NavigationLink {
                    PackagesView()
                } label: {
                    MenuRow(title:"SwiftUI Packages", leftIcon: "square.stack.fill")
                }
                divider 
                Link(destination: URL(string: "https://youtube.com")!) {
                    MenuRow(title: "Youtube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                }
            }
            .padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            VStack {
                Text("Learnzilla © 2022")
                Text("Version 1.00")
            }
            .foregroundColor(.white)
            .opacity(0.7)
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            .font(.footnote)
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
