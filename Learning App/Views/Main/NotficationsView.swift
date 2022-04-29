//
//  NotficationsView.swift
//  Learning App
//
//  Created by Amish Tufail on 29/04/2022.
//

import SwiftUI

struct NotficationsView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                sectionsSection
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Notifications", hasScrolled: .constant(true))
            )
            .background(Image("Blob 1").offset(x: -180, y: 300))
        }
    }
    
    var sectionsSection: some View {
        VStack(alignment: .leading) {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                if index != 0 { Divider() }
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

struct NotficationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotficationsView()
    }
}
