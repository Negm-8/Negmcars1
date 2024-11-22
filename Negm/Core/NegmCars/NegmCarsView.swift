//
//  MySearchView.swift
//  Negm
//
//  Created by abdallah negm on 26/08/2024.
//

import SwiftUI

struct NegmCarsView: View {
    @StateObject private var viewModel: HomeViewModel
    @State private var currentAdIndex = 0
    var MySearchCars: [Car]
    let adImages = ["20", "13", "14", "15", "22", "16", "6", "7", "9", "10", "11", "21", "23", "24", "25", "26", "27"]
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.MySearchCars = viewModel.cars.filter { $0.isFavorite == true }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) { // Change the spacing to 0 for a continuous flow
                    // Ad space - display ad images and switch every 5 seconds
                    AdView(adImages: adImages, currentAdIndex: $currentAdIndex)
                        .frame(height: 310)
                        .padding(.horizontal)
                    
                    // "NegmCars" Section
                    HStack {
                        Text("NegmCars")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top, 15)
                    .padding(.bottom, 3)
                    
                    // CarNegmCars view to display the cars
                    CarNegmCars()
                        .padding(.horizontal, 1)
                    
                    Spacer(minLength: 0) // Remove extra space here to make it extend fully to the bottom
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures the view expands to the full screen
            }
            .background(Color(.systemGray).ignoresSafeArea()) // Make background cover full screen
            .navigationBarHidden(true)
            .onAppear {
                startAdTimer()
            }
        }
    }
    
    // Timer function to switch ads every 5 seconds
    func startAdTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            currentAdIndex = (currentAdIndex + 1) % adImages.count
        }
    }
}

struct AdView3: View {
    var adImages: [String]
    @Binding var currentAdIndex: Int
    
    var body: some View {
        TabView(selection: $currentAdIndex) {
            ForEach(0..<adImages.count, id: \.self) { index in
                Image(adImages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 310)
    }
}

// Preview setup
struct NegmCarsView_Previews: PreviewProvider {
    static var previews: some View {
        NegmCarsView(viewModel: HomeViewModel())
    }
}
