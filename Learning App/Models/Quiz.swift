//
//  Quiz.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

class Result: Identifiable, Decodable {
    var id = UUID()
    var question: String
    var correct_answer: String
    var incorrect_answer: [String]

}

