//
//  LibraryView.swift
//  Learning App
//
//  Created by Amish Tufail on 29/04/2022.
//

import SwiftUI

struct LibraryView: View {
    @State var showCertificates: Bool = false
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                CertificateView()
                    .frame(height: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(20)
                            .offset(y: -30)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(40)
                            .offset(y: -60)
                    )
                    .padding(20)
                    .onTapGesture {
                        withAnimation {
                            showCertificates = true
                        }
                    }
                Text("History".uppercased())
                    .titleStyle() // custom modifier
                coursesSection
                Text("Topics".uppercased())
                    .titleStyle()
                topicsSection
            }
            .safeAreaInset(edge: .top, content: { // To offset the course items
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Library", hasScrolled: .constant(true))
            )
            .background(Image("Blob 1").offset(x: -100, y: -400))
        }
        .fullScreenCover(isPresented: $showCertificates) {
            CertificateCardView()
        }
    }
    
    var coursesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(courses) { course in
                    SmallCourseItem(course: course)
                }
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
     
    var topicsSection: some View {
        VStack {
            ForEach(Array(topics.enumerated()), id: \.offset) { index, topic in
                if index != 0 { Divider() }
                ListRow(topic: topic)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
