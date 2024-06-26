//
//  AccountView.swift
//  Learning App
//
//  Created by Amish Tufail on 22/03/2022.
//

import SwiftUI
import FirebaseAuth
import AudioToolbox

struct AccountView: View {
    let generator = UISelectionFeedbackGenerator()
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.dismiss) var dismiss // for Done Button
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                Section {
                    Toggle(isOn: $isLiteMode) {
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }
                .accentColor(.primary)
                links
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isLogged = false
                    }
                    dismiss()
                    signOut()
                    generator.selectionChanged()
                } label: {
                    Text("Sign out")
                        .tint(.red)
                }
                
            }
            .refreshable { // For refreshing 
            }
            .listStyle(.insetGrouped) // would adopt automatic to different devices
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button {
                dismiss()
                generator.selectionChanged()
            } label: { Text("Done").bold() })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8.0) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .font(.system(size: 32))
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
//                     Using canvas instead of this
//                    Image(systemName: "hexagon")
//                        .symbolVariant(.fill)
//                        .foregroundColor(.blue)
//                        .font(.system(size: 200))
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6) // For size adjusting
                    
                )
            Text("Amish")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.medium)
                Text("Pakistan")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink { HomeView() } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { Text("Help") } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        //                .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    deleteButton
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link") 
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                pinButton
            }
        }
        .listRowSeparator(.hidden)
        .accentColor(.primary)
    }
    
    var deleteButton: some View {
        Button(action: { isDeleted = true }) {
            Label("Delete", systemImage: "trash")
        }
        .tint(.red)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
            
        }
        .tint(isPinned ? .gray : .yellow)
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

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
