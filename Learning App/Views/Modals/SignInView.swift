//
//  SignInView.swift
//  Learning App
//
//  Created by Amish Tufail on 23/04/2022.
//

import SwiftUI
import AudioToolbox // For Haptics
import FirebaseAuth

struct SignInView: View {
    let generator = UISelectionFeedbackGenerator() // For Haptics
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
    @FocusState var showKeyboard: Bool
    @State var appear = [false, false, false]
    @AppStorage("showAlertView") var showAlertView: Bool = false
    @AppStorage("alertTitle") var alertTitle: String = ""
    @AppStorage("alertMessage") var alertMessage: String = ""
    @EnvironmentObject var model: Model
    @AppStorage("isLogged") var isLogged = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sign in")
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
                        .onTapGesture { // For Haptics
                            generator.selectionChanged()
                        }
                        .focused($showKeyboard)
                    SecureField("Password", text: $password)
                        .inputStyle(icon: "lock")
                        .focused($showKeyboard)
                        .textContentType(.password)
                    // For Button Animation
                        .focused($focusedField, equals: .password)
                        .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                        .overlay(geometry)
                        .onPreferenceChange(CirclePreferenceKey.self) { value in
                            passwordY = value
                        }
                        .onTapGesture { // For Haptics
                            generator.selectionChanged()
                        }
                    Button {
                        generator.selectionChanged()
                        signin()
    //                    isLogged = true
                        showKeyboard = false
                    } label: {
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .gradientForeground(colors: [.pink, .blue, .purple, .pink])
                        
                    }
                    .onAppear { // To show HomeView if user successfully logins
                        Auth.auth()
                            .addStateDidChangeListener { auth, user in
                                if user != nil {
                                    isLogged = true
                                }
                            }
                    }
                    //            .buttonStyle(.borderedProminent)
                    //            .buttonStyle(AngularButtonStyle())
                    .font(.headline)
                    .buttonStyle(.angular)
                    .tint(.blue)
                    .controlSize(.large) // Button Size
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                    Divider()
                    HStack {
                        Text("No account yet?")
                        Button {
                            model.selectedModal = .signUp
                            generator.selectionChanged()
                        } label: {
                            Text("**Sign up**")
                        }
                        
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accentColor(.secondary)
                    HStack {
                        Text("Forgot password?")
                        Button {
                            sendPasswordResetEmail()
                            generator.selectionChanged()
                            showKeyboard = false
                        } label: {
                            Text("**Reset password**")
                        }
                        
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accentColor(.secondary)
                    Divider()
                    Button {
                        print("Sign in with Apple")
                        generator.selectionChanged()
                    } label: { // Apple Button
                        AppleButton1()
                            .frame(height: 50)
                            .cornerRadius(16)
                    }
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
//            .alert(isPresented: $showAlertView) {
//                Alert()
//        }
  
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
    
    func signin() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                self.alertTitle = "Alert"
                self.alertMessage = (error!.localizedDescription)
                self.showAlertView.toggle()
                return
            }
            print("User is Signed In")
            isLogged = true
        }
    }
    
    func sendPasswordResetEmail() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                self.alertTitle = "Alert"
                self.alertMessage = (error!.localizedDescription)
                self.showAlertView.toggle()
                return
            }
            print("Password Reset Email Sent!")
            alertTitle = "Alert"
            alertMessage = "Check your inbox for an email to reset your password."
            showAlertView.toggle()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
             SignInView()
                .environmentObject(Model())
                .statusBar(hidden: true)
        }
    }
}
