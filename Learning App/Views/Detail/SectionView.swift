//
//  SectionView.swift
//  Learning App
//
//  Created by Amish Tufail on 26/04/2022.
//

import SwiftUI
import AudioToolbox
import AVKit

struct SectionView: View {
    @State var showQuiz = false
    var section: CourseSection = courseSections[0]
    let generator = UISelectionFeedbackGenerator()
    @State var player = AVPlayer()
    @State var showVideo = false
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .overlay(
                        Button {
                            showVideo = true
                        } label: {
                            PlayView().overlay(CircularView(value: section.progress, lineWidth: 5).padding(24))
                        }
                    )
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
            
            if showVideo {
                VideoView(videoName: section.video)
            }
        }
        .statusBar(hidden: true)
        .fullScreenCover(isPresented: $showQuiz) {
            WelcomeView()
                .statusBar(hidden: true)
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 500)
        )
        .background(
            Image(section.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .overlay(
            overlayContent
        )
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Take Test".uppercased())
                            .foregroundColor(.primary)
                            .font(.footnote, weight: .semibold)
                            .padding(.bottom, 1)
                        Text("Answer question,")
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.caption)
                        Text("Gain Certficate")
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.caption)
                    }
                    Image(systemName: "highlighter")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(8)
                        .background(
                            Circle()
                                .stroke()
                                .fill(.gray.opacity(0.2))
                        )
                }
                .frame(width: 185, height: 80)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                .onTapGesture {
                    showQuiz = true
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Download".uppercased())
                            .foregroundColor(.primary)
                            .font(.footnote, weight: .semibold)
                            .padding(.bottom, 1)
                        Text("Watch offline")
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.caption)
                        Text("35.55MB filesize")
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.caption)
                    }
                    Image(systemName: "square.and.arrow.down")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(8)
                        .background(
                            Circle()
                                .stroke()
                                .fill(.gray.opacity(0.2))
                        )
                }
                .frame(width: 185, height: 80)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                Spacer()
            }
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
    }
    
    var button: some View {
        Button {
            dismiss()
            generator.selectionChanged()
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(section.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            Text(section.text)
                .font(.footnote)
            Divider()
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Taught by Amish")
                    .font(.footnote)
            }
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .offset(y: 250)
        .padding(20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
            .preferredColorScheme(.dark)
    }
}

