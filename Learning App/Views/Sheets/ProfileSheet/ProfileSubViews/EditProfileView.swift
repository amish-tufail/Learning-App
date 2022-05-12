//
//  EditProfileView.swift
//  Learning App
//
//  Created by Amish Tufail on 12/05/2022.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    let generator = UISelectionFeedbackGenerator()
    @State var editingNameTextField = false
    @State var editingTwitterTextField = false
    @State var editingSiteTextField = false
    @State var editingBioTextField = false
    @State var nameIconBounce = false
    @State var twitterIconBounce = false
    @State var siteIconBounce = false
    @State var bioIconBounce = false
    @State var name = ""
    @State var twitter = ""
    @State var site = ""
    @State var bio = ""
    @State var showImagePicker = false
    @State var inputImage: UIImage?
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.largeTitle.bold())
                        .padding(.top, 90)
                    Text("Manage your Learnzilla profile and account")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.callout)
                    Button {
                        self.showImagePicker = true
                    } label: {
                        HStack(spacing: 12) {
                            TextfieldIcon(iconName: "person.crop.circle", passedImage: $inputImage, currentlyEditing: .constant(false))
                            Text("Choose Photo")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                        .background(
                            Color.init(red: 26/255, green: 20/255, blue: 51/255)
                                .cornerRadius(16)
                        )
                    }
                    GradientTextfield(editingTextfield: $editingNameTextField, textfieldString: $name, iconBounce: $nameIconBounce, textfieldPlaceholder: "Name", textfieldIconString: "textformat.alt")
                        .autocapitalization(.words)
                        .textContentType(.name)
                        .disableAutocorrection(true)
                    GradientTextfield(editingTextfield: $editingTwitterTextField, textfieldString: $twitter, iconBounce: $twitterIconBounce, textfieldPlaceholder: "Twitter", textfieldIconString: "at")
                        .autocapitalization(.none)
                        .keyboardType(.twitter)
                        .disableAutocorrection(true)
                    GradientTextfield(editingTextfield: $editingSiteTextField, textfieldString: $site, iconBounce: $siteIconBounce, textfieldPlaceholder: "Website", textfieldIconString: "link")
                        .autocapitalization(.none)
                        .keyboardType(.webSearch)
                        .disableAutocorrection(true)
                    GradientTextfield(editingTextfield: $editingBioTextField, textfieldString: $bio, iconBounce: $bioIconBounce, textfieldPlaceholder: "Bio", textfieldIconString: "text.justifyleft")
                        .autocapitalization(.sentences)
                        .keyboardType(.default)
                    GradientButton(buttonTitle: "Save Settings") {
                        generator.selectionChanged()
                        dismiss()
                    }
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$inputImage)
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
            .offset(y: 35)
        }
        .background(Color("settingsBackground"))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .colorScheme(.dark)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
