//
//  Answer.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

struct Answer: Identifiable {
    var id = UUID()
    var text:  AttributedString
    var isCorrect: Bool
}
