//
//  NegmApp.swift
//  Negm
//
//  Created by abdallah negm on 21/07/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct NegmApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabBarView()
                    .navigationBarBackButtonHidden(true) // منع زر الرجوع الافتراضي
                    .navigationBarHidden(true) // إخفاء شريط التنقل بالكامل
            }
        }
    }
}


