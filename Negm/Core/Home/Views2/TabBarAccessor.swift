//
//  tabbar.swift
//  Negm
//
//  Created by abdallah negm on 01/11/2024.
//

import SwiftUI

// يستخدم TabBarAccessor للوصول إلى شريط التبويب (Tab Bar) الخاص بالـ UITabBarController في SwiftUI
struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar?) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        DispatchQueue.main.async {
            self.callback(viewController.tabBarController?.tabBar)
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
