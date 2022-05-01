//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Amish Tufail on 21/03/2022.
//

import SwiftUI
import Firebase

@main
struct Learning_AppApp: App {
    @StateObject var model = Model() // state object ensures that we will not call this many time
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
