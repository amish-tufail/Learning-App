//
//  SignUpView.swift
//  Learning App
//
//  Created by Amish Tufail on 20/04/2022.
//

import SwiftUI

struct SignUpView: View {
    enum Field: Hashable { // For Email and Password button highlight
        case email
        case password
    }
    @State var email = ""
    @State var password = ""
    @FocusState var focusedField: Field? // For Button Highlighting
    @State var circleY: CGFloat = 120
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle).bold()
                .opacity(appear[0] ? 1 : 0)
                .offset(y: appear[0] ? 0 : 20)
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
                .opacity(appear[1] ? 1 : 0)
                .offset(y: appear[1] ? 0 : 20)
            Group {
                TextField("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                // For Button Animation
                    .focused($focusedField, equals: .email)
                    .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self) { value in
                        emailY = value
                        circleY = value
                    }
                SecureField("Password", text: $password)
                    .inputStyle(icon: "lock")
                    .textContentType(.password)
                // For Button Animation
                    .focused($focusedField, equals: .password)
                    .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self) { value in
                        passwordY = value
                    }
                Button {} label: {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .gradientForeground(colors: [.pink, .blue, .purple, .pink])
                    
                }
                //            .buttonStyle(.borderedProminent)
                //            .buttonStyle(AngularButtonStyle())
                .font(.headline)
                .buttonStyle(.angular)
                .tint(.blue)
                .controlSize(.large) // Button Size
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                Text("By clicking on  ")
                + Text("_Create Account_")
                    .foregroundColor(.primary.opacity(0.7))
                + Text(", you agree to out **Terms of Service** and **[Privacy Policy](https://apple.com)**")
                Divider()
                HStack {
                    Text("Already have an account?")
                    Button {
                        model.selectedModal = .signIn
                    } label: {
                        Text("**Sign in**")
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .accentColor(.secondary)
            }
            .opacity(appear[2] ? 1 : 0)
            .offset(y: appear[2] ? 0 : 20)
        }
        .padding(20) // Internal Padding
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            //                .offset(y: 200)
                .offset(y: circleY)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
        //        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        //        .padding(20) // Outside Padding
        //        .background(
        //            Image("Blob 1")
        //                .offset(x: 200, y: -100)
        //        )
        .onChange(of: focusedField) { value in
            withAnimation {
                if value == .email {
                    circleY = emailY
                    circleColor = .blue
                } else {
                    circleY = passwordY
                    circleColor = .red
                }
            }
        }
        .onAppear {
            withAnimation(.spring().delay(0.1)) {
                appear[0] = true
            }
            withAnimation(.spring().delay(0.2)) {
                appear[1] = true
            }
            withAnimation(.spring().delay(0.3)) {
                appear[2] = true
            }
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignUpView()
                .environmentObject(Model())
        }
    }
}
