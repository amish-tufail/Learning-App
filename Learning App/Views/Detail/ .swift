//
//  CourseView.swift
//  Learning App
//
//  Created by Amish Tufail on 16/04/2022.
//

import SwiftUI
import AudioToolbox

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    let generator = UISelectionFeedbackGenerator()
    @Binding var show: Bool
    @State var appear = [false, false, false] // insfe
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDragaable = true
    @State var showSection = false
    @State var selectedIndex = 0
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll") // solves the featured Course View blur problem
            .onAppear{
                model.showDetail = true
            }
            .onDisappear{
                model.showDetail = false
            }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous)) // For the dragged screen
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10) // When we use drag gesture
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500)) // for dimming when dragged
            .background(.ultraThinMaterial) // appling blur effect to the above background
            .gesture(isDragaable ? drag : nil) // using some Gesture in this case, disables the drag when view closes so stops the animation
            .ignoresSafeArea()
            
            button
        }
        .onAppear { // to make them appear with a delay and animation ( taught one )
            fadeIn()
        }
        .onChange(of: show) { newValue in // To disspear them instantly ( taught one )
            fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500) // scrollY extends the height the View
            .foregroundColor(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0) // To move at different speed
                    .accessibilityLabel("Cover Image") // For VoiceOver
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0) // For parallex Effect
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1) // Creates a more pronounce scale Effect
                    .blur(radius: scrollY / 10)
            )
            .mask(
                {
                    // cornerRadius: appear[0] ? 0 : 30.0, style: .continuous
                    RoundedRectangle(cornerRadius: 30, style: .continuous) // appear rmoves the corner radius on the background when the view is loaded completely
                        .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                        .offset(y: scrollY > 0 ? -scrollY : 0) // For parallex Effect, here it clips the content
                }
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0) // To move at different speed
            )
        }
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                if index != 0 { Divider() }
                SectionRow(section: section)
                    .onTapGesture {
                        selectedIndex = index
                        showSection = true
                        generator.selectionChanged()
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .fullScreenCover(isPresented: $showSection) {
            SectionView(section: courseSections[selectedIndex])
        }
    }
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                model.showDetail.toggle() // for navbar hidding
                generator.selectionChanged()
            }
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
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id) ", in: namespace)
            Divider()
                .opacity(appear[0] ? 1 : 0)
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
            .opacity(appear[0] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local) // fixes the horizontal gesture stuck problem
            .onChanged { value in
                guard value.translation.width > 0 else { return } // to avoid the right drag gesture
                if value.startLocation.x < 100 { // allows to swipe only for the first 100 length of the screen horizontally
                    withAnimation(.closeCard) {
                        viewState = value.translation // Begins the Gesture
                    }
                }
                if viewState.width > 120 { // auto terminates the gesture
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 { // Goes the main view when the drag gesture reaches a certain length
//                            withAnimation(.closeCard.delay(0.3)) {
//                                show.toggle()
//                                model.showDetail.toggle() // for navbar hidding
//                            }
                    close()
                } else {
                    withAnimation(.closeCard) {
                        viewState = .zero // Ends the gesture
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeInOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeInOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeInOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() { // Created this function so that the main view loads auto without us lifting our finger on the screen when the gesture reaches a certain length
        withAnimation(.closeCard.delay(0.3)) {
            show.toggle()
            model.showDetail.toggle()
        }
        withAnimation(.closeCard) {
        viewState = .zero
        }
        isDragaable = false
    }
    
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace // only for preview
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
