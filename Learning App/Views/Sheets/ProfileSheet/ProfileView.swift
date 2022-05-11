//
//  ProfileView.swift
//  Learning App
//
//  Created by Amish Tufail on 07/05/2022.
//

import SwiftUI
import FirebaseAuth
import AudioToolbox

struct ProfileView: View {
    let generator = UISelectionFeedbackGenerator()
    @State var showCertificates: Bool = false
    @State var contentOffset = CGFloat(0)
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @Environment(\.dismiss) var dismiss // for Done Button
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offset in
                    contentOffset = offset.y
                })
                {
                    content
                        .padding(.top, 20)
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
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // For iPad
//        .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))) // For navtitle color
    }
    
    var content: some View {
        ZStack {
            VStack {
                ProfileRow()
                    .padding(.top, 10)
                    .onTapGesture {
                        showCertificates = true
                        generator.selectionChanged()
                    }
                VStack {
                    NavigationLink {
                        HistoryView()
                    } label: {
                        MenuRow(title: "History", leftIcon: "arrow.counterclockwise")
                    }
                    divider
                    NavigationLink {
                        FavoritesView()
                    } label: {
                        MenuRow(title:"Favorties", leftIcon: "star.fill")
                    }
                    divider
                    NavigationLink {
                        DownloadsView()
                    } label: {
                        MenuRow(title:"Downloads", leftIcon: "square.and.arrow.down.fill")
                    }
                    divider
                    NavigationLink {
                        UpdatesView()
                    } label: {
                        MenuRow(title:"Updates", leftIcon: "newspaper.fill")
                    }
                }
                .blurBackground()
                .padding(.top, 20)
                VStack {
                    NotificationsRow()
                    divider
                    LiteModeRow()
                }
                .blurBackground()
                .padding(.top, 20)
                VStack {
                    NavigationLink {
                        EditProfileView()
                    } label: {
                        MenuRow(title: "Edit Profile", leftIcon: "gearshape.fill")
                    }
                    divider
                    NavigationLink {
                        BillingView()
                    } label: {
                        MenuRow(title:"Billing", leftIcon: "gift.fill")
                    }
                    divider
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isLogged = false
                        }
                        dismiss()
                        signOut()
                        generator.selectionChanged()
                    } label: {
                        MenuRow(title:"Sign Out", leftIcon: "pip.exit")
                    }
                }
                .blurBackground()
                .padding(.top, 20)
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
                    Link(destination: URL(string: "https://discord.com")!) {
                        MenuRow(title: "Discord Community", leftIcon: "ellipsis.bubble.fill", rightIcon: "link")
                    }
                    divider
                    Link(destination: URL(string: "https://youtube.com")!) {
                        MenuRow(title: "Youtube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                    }
                }
                .blurBackground()
                .padding(.top, 20)
                VStack {
                    MenuRow(title: "Privacy Policy", leftIcon: "doc.fill", rightIcon: "link")
                    divider
                    MenuRow(title: "Terms of Sevice", leftIcon: "doc.fill", rightIcon: "link")
                }
                .blurBackground()
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
            .fullScreenCover(isPresented: $showCertificates) {
                CertificateCardView()
            }
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
            .offset(y: -40)
        }
    }
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            print("Logged Out")
        } catch {
            print("Already logged out")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
