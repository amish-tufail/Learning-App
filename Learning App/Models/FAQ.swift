//
//  FAQ.swift
//  Learning App
//
//  Created by Amish Tufail on 08/05/2022.
//

import SwiftUI

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}
