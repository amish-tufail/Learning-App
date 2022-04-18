//
//  FeaturedItem.swift
//  Learning App
//
//  Created by Amish Tufail on 11/04/2022.
//

import SwiftUI

struct FeaturedItem: View {
    var course: Course = featuredCourses[0] // Default value for the preview only
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer() // pushed everything to bottom from image to mutlitext
            Image(course.logo)
                .resizable(resizingMode: .stretch) // from inspector
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding(9.0) // this padding and the below modifer gives a round outer to the image
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                .strokeStyle(cornerRadius: 16.0)
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            Text(course.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(course.text)
                .font(.footnote)
                .multilineTextAlignment(.leading) // from inspector
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading) // infinity = max possible space occupied
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0) // padding inside the card top and bottom
        .frame(height: 350.0)
        .background(.ultraThinMaterial) // using instead of Color("Background"), in: gives the same effect as using a .mask()
        .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
//        .cornerRadius(30.0)
//        .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous)) // mask is similar to cornerRadius
//        .shadow(color: Color("Shadow").opacity(0.3), radius: 10.0, x: 0.0, y: 10.0) // using in home view
//        .modifier(StrokeStyle()) // Using this instead of the code inside the struct StrokeStyle
        .strokeStyle() // using this by extension instead of the above one
        .padding(.horizontal, 20.0) // padding on the outer horizontal
//        .background(
//            Image("Blob 1")
//                .offset(x: 250, y: -100)
//        ) // using it in home view 
//        .overlay(
//            Image(course.image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 230)
//                .offset(x: 32, y: -80)
//    ) // using in home view
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
