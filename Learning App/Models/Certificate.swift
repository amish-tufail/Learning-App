//
//  Certificate.swift
//  Learning App
//
//  Created by Amish Tufail on 10/05/2022.
//

import Foundation
import SwiftUI

struct Certificate: Identifiable, Decodable {
    var id: String
    var course: String
    var date: String
    var logo: String
    var instructor: String
}


