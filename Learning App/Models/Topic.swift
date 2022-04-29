//
//  Topic.swift
//  Learning App
//
//  Created by Amish Tufail on 29/04/2022.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "iOS Development", icon: "iphone"),
    Topic(title: "UI Design", icon: "eyedropper"),
    Topic(title: "Web development", icon: "laptopcomputer")
]

