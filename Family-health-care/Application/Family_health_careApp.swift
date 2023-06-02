//
//  AppDelegate.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/06.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Family_health_careApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Home()
//                    .environmentObject(Test())
                    .environmentObject(Chats(token: "admin"))
                    .environmentObject(Posts())
                    .environmentObject(Storys())
            }
        }
    }
}
 
