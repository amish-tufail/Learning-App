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
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environmentObject(model)
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate  {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}
