//
//  HomeView.swift
//  Negm
//
//  Created by abdallah negm on 24/07/2024.1

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var currentAdIndex = 0
    let adImages = ["12", "13", "14", "15", "911", "16", "6", "7", "9", "10", "11"] // استبدل هذه الأسماء بصور الإعلانات الحقيقية
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color(.gray)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 1) {
                        Spacer().frame(height: 60)
                        
                        // مساحة الإعلان - عرض صور الإعلانات والتبديل بينها كل 5 ثوانٍ
                        AdView(adImages: adImages, currentAdIndex: $currentAdIndex)
                            .frame(height: 310) // زيادة ارتفاع مساحة الإعلان
                            .padding(.horizontal)
                        
                        HStack {
                            Text("New Cars")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top, 15)
                        .padding(.bottom, 3)
                        
                        GeometryReader { geometry in
                            NewCars()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .padding(.vertical, 0)
                        }
                        .frame(height: 340)
                        
                        // قسم "Old Cars" الجديد
                        HStack {
                            Text("Old Cars")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top, 15)
                        .padding(.bottom, 3)
                        
                        GeometryReader { geometry in
                            OldCars()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .padding(.vertical, 0)
                        }
                        .frame(height: 340)
                        
                        Button(action: {
                            // إضافة الحركة المطلوبة هنا
                        }, label: {
                            HStack {
                                // محتوى الزر هنا
                            }
                            .frame(height: 37)
                            .overlay {
                                Capsule()
                                    .stroke(lineWidth: 0.9)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        })
                        .padding() 
                    }
                }
                .navigationBarHidden(true)
            }
            .background(Color.gray)
            .ignoresSafeArea()
            .onAppear {
                startAdTimer()
            }
        }
    }
    
    // دالة المؤقت للتبديل بين الإعلانات كل 5 ثوانٍ
    func startAdTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            currentAdIndex = (currentAdIndex + 1) % adImages.count
        }
    }
}

struct AdView: View {
    var adImages: [String]
    @Binding var currentAdIndex: Int
    
    var body: some View {
        TabView(selection: $currentAdIndex) {
            ForEach(0..<adImages.count, id: \.self) { index in
                Image(adImages[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .cornerRadius(10)
        .animation(.easeInOut(duration: 1), value: currentAdIndex)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
