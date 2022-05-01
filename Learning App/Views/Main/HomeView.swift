//
//  HomeView.swift
//  Learning App
//
//  Created by Amish Tufail on 11/04/2022.
//

import SwiftUI
import AudioToolbox
struct HomeView: View {
    let generator = UISelectionFeedbackGenerator()
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false // to show Course Item on false and Course View on true
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showCourse = false // For Featured -> Course View
    @State var selectedIndex = 0 // For Featured -> Course View
    @EnvironmentObject var model: Model
    @AppStorage("isLiteMode") var isLiteMode = true
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea() // OffWhite Color
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {  // using to layout for different screen sizes, spacing is for rows here, inner spacing is for column
                    if !show {
                        cards
                    } else {
                        // Here to solve the problem of view going back to top, as when we go to course view then everything vanishes at the back so to solve this we create the sem dummy cards so that view doesnt go back to top
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll") // to make the coordinates  according to the scroll
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
                // .opacity(hasScrolled ? 1 : 0) // as it is on nav bar as a whole so it dissappears
            )
            if show {
                detail
            }
            
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }       
            }
        }
    }
    var scrollDetection: some View {
        GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView { // to make the cards horizontally swipeable
            ForEach(Array(featuredCourses.enumerated()), id: \.offset) { index, course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(isLiteMode ? 0 : 0.3), radius: 5.0, x: 0.0, y: 3.0) // here shadow applies to every single item as the card is not clipped, so to clip the card we will remove the 'in' thing in the background and use mask in its place as mask clips the card
                        .blur(radius: abs(minX) / 40) // abs = absolute 
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80) // for normal postioning
                                .offset(x: minX / 2) // for parallex effect
                    )
                        .onTapGesture { // button option also can be implemented instead of this
                            showCourse = true
                            selectedIndex = index
                        }
//                    Text("\(proxy.frame(in: .global).minX)")
                        .accessibilityElement(children: .combine) // To combine all element of featured item as one for voiceover
                        .accessibilityAddTraits(.isButton)
                }
                
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
                .accessibility(hidden: true) // To hide it in voiceover
        )
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: namespace, course: featuredCourses[selectedIndex],  show: $showCourse)
        }
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, course: course, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle() // toggles for tab bar
                        showStatusBar = false
                        selectedID = course.id
                        generator.selectionChanged()
                    }
            }
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isButton)
        }
    }
    
    var detail: some  View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, course: course, show: $show)
                    .zIndex(1) // a level higher than the default zero
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2)))
                )
            }
        }
    }
} 

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model()) 
    }
}
