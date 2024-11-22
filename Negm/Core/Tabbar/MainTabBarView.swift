//
//  MainTabBarView.swift
//  Negm
//
//  Created by abdallah negm on 24/07/2024.

import SwiftUI

struct MainTabBarView: View {
    
    @State private var selectedTab: Int = 0
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
//            هنا مكان navagition بتاع صفحه add الي فيها ٢ زر 
//            AddView2()
//                .tabItem {
//                    VStack {
//                        Image(systemName: "plus.circle")
//                        Text("Add")
//                    }
//                }
            
            
            
            NegmCarsView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "car.circle.fill")
                        Text("Negm Cars")
                    }
                }
            
            
            
            Text("Renting")
                .tabItem {
                    VStack {
                        Image(systemName: "car.rear.road.lane")
                        Text("Renting cars")
                    }
                }
            
        
            MoreView()
                .tabItem {
                    VStack {
                        Image(systemName: "line.3.horizontal")
                        Text("More")
                    }
                }
            
            
            
            
                .onAppear {
                    UITabBar.appearance().backgroundColor = .white
                }
        }
    }
}

#Preview {
    MainTabBarView().tint(.orange)
}

// هنا بغيل لون التاب بار اول ما اضغط علي حاجه يتغير لونها في السطر الي فوقي علي طول
