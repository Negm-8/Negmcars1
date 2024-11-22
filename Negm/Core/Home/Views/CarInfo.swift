//
//  CarInfo.swift
//  Negm
//
//  Created by abdallah negm on 19/10/2024.
//


import SwiftUI

// تعريف بيانات السيارة
struct CarInfo: Identifiable {
    let id = UUID()
    let image: String
    let type: String
    let model: String
    let year: String
    let price: String
    let isNew: Bool // لتحديد ما إذا كانت السيارة جديدة أم مستعملة
    let mileage: String? // المسافة المقطوعة في حالة كون السيارة مستعملة
}

// عرض صفحة السيارات المعروضة للبيع باسم CarSallView
struct CarSallView1 : View {
    // قائمة السيارات
    let cars = [
        CarInfo(image: "car_image_1", type: "Mercedes", model: "C 200", year: "2023", price: "$60,000", isNew: true, mileage: nil),
        CarInfo(image: "car_image_2", type: "BMW", model: "BMW X1", year: "2024", price: "$50,000", isNew: false, mileage: "15,000 km")
        // أضف المزيد من السيارات هنا
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(cars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) { // ربط بـ CarDetailView
                        HStack(spacing: 12) {
                            // صورة السيارة
                            Image(car.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(8)
                            
                            // معلومات السيارة
                            VStack(alignment: .leading, spacing: 6) {
                                Text("\(car.type) \(car.model) \(car.year)")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color.primary)
                                
                                Text(car.price)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.green)
                                
                                if car.isNew {
                                    Text("جديدة")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.blue)
                                } else if let mileage = car.mileage {
                                    Text("المسافة المقطوعة: \(mileage)")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.gray)
                                }
                            }
                            .padding(.leading, 10)

                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 8)
                    }
                }
            }
            .padding(.horizontal)
            .background(Color.gray)
        }
        .navigationBarHidden(true)
    }
}

struct CarSallView_Previews : PreviewProvider {
    static var previews: some View {
        CarSallView1()
    }
}
