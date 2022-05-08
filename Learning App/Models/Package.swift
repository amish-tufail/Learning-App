//
//  Package.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI

struct Package: Identifiable {
    var id = UUID()
    var title: String
    var link: String
}

let packagesData = [
    Package(
        title: "Firebase",
        link: "https://github.com/firebase/firebase-ios-sdk.git"
    ),
    Package(
        title: "SDWebImageSwiftUI",
        link: "https://github.com/SDWebImage/SDWebImageSwiftUI.git"
    ),
    Package(
        title: "SwiftUITrackableScrollView",
        link: "https://github.com/maxnatchanon/trackable-scroll-view"
    ),
    Package(
        title: "SwiftUIX",
        link: "https://github.com/SwiftUIX/SwiftUIX.git"
    )
]
