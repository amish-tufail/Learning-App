//
//  Suggestion.swift
//  Learning App
//
//  Created by Amish Tufail on 19/04/2022.
//

import SwiftUI

struct Suggestion: Identifiable {
    var id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
