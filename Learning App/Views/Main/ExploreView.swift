//
//  ExploreView.swift
//  Learning App
//
//  Created by Amish Tufail on 29/04/2022.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                coursesSection
                Text("Topics".uppercased())
                    .titleStyle()
                topicsSection
                Text("Popular".uppercased())
                    .titleStyle() // custom modifier 
                handbookSection
            }
            .safeAreaInset(edge: .top, content: { // To offset the course items
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Recent", hasScrolled: .constant(true))
            )
            .background(Image("Blob 1").offset(x: -100, y: -400))
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
    
    var handbookSection: some View {
        HStack(alignment: .top, spacing: 16) {
              ForEach(handbooks) { handbook in
                HandbookItem(handbook: handbook)
            }
        }
        .padding(.horizontal, 20)
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


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
