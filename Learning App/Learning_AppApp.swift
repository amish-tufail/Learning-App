//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Amish Tufail on 21/03/2022.
//

import SwiftUI

@main
struct Learning_AppApp: App {
    @StateObject var model = Model() // state object ensures that we will not call this many time
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
