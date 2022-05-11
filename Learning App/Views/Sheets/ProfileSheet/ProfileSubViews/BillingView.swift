//
//  BillingView.swift
//  Learning App
//
//  Created by Amish Tufail on 11/05/2022.
//

import SwiftUI

struct BillingView: View {
    @State var title = "Purchase Lifetime Pro Plan"
    @AppStorage("showAlertView") var showAlertView: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("background-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
//                        ZStack {
//                            Circle()
//                                .foregroundColor(Color("pink-gradient-1"))
//                                .frame(width: 66, height: 66)
//                            Image(systemName: "person.fill")
//                                .foregroundColor(.white)
//                                .font(.system(size: 24, weight: .medium, design: .rounded))
//                        }
//                        .frame(width: 66, height: 66, alignment: .center)
                        GradientProfilePictureView(profilePicture: UIImage(named: "Profile3")!)
                            .frame(width: 66, height: 66)
                        VStack(alignment: .leading) {
                            Text("Amish")
                                .foregroundColor(.white)
                                .font(.title2, weight: .bold)
                            Text("View Profile")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.footnote)
                        }
                        Spacer()
                        
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.1))
                    Text("Instructor at Learnzilla")
                        .foregroundColor(.white)
                        .font(.title2, weight: .bold)
                    Label("Awarded 4 certificates since May 2022", systemImage: "calendar")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.footnote)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.1))
                    HStack(spacing: 16) {
                        Image("Twitter")
                            .resizable()
                            .foregroundColor(.white.opacity(0.7))
                            .frame(width: 24, height: 24, alignment: .center)
                        Image(systemName: "link")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                        Text("learnzilla.com")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.footnote)
                    }
                }
                .padding(16)
                GradientButton(buttonTitle: title) {
                    showAlertView.toggle()
                    title = "Purchase Successful"
                }
                .padding(.horizontal, 16)
                Button {
                    print("Restore")
                } label: {
                    Text("Restore Purchases")
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                        .font(.footnote, weight: .bold)
                }
                .padding(.bottom)
            }
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Color.white.opacity(0.2))
                    .background(Color("secondaryBackground").opacity(0.5))
                    .background(VisualEffectBlur(blurStyle: .dark))
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
            VStack {
                Spacer()
                Button {
                    withAnimation(.easeOut) {
                        dismiss()
                    }
                } label: {
                    Image(systemName: "arrow.turn.up.forward.iphone.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 0.0, z: 1.0)
                        )
                        .background(
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                .frame(width: 42, height: 42, alignment: .center)
                                .overlay(
                                    VisualEffectBlur(blurStyle: .dark)
                                        .cornerRadius(21)
                                        .frame(width: 42, height: 42, alignment: .center)
                                )
                        )
                }
            }
            .padding(.bottom, 64)
            if showAlertView {
                Purchase()
            }
        }
        .colorScheme(.dark)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Billing").font(.largeTitle)
        .navigationBarHidden(true)
    }
}

struct BillingView_Previews: PreviewProvider {
    static var previews: some View {
        BillingView()
    }
}
