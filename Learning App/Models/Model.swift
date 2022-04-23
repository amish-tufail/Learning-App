//
//  Model.swift
//  Learning App
//
//  Created by Amish Tufail on 18/04/2022.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
