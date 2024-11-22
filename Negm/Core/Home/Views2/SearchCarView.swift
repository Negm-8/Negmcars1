//
//  CarView.swift
//  Negm
//
//  Created by abdallah negm on 31/08/2024.
//

import SwiftUI

struct SearchCarView: View {
    // نموذج بيانات السيارة
    struct Car: Identifiable {
        let id = UUID()
        let image: String
        let model: String
        let year: String
        let price: String
        let details: String
        let mileage: String
        let brand: String
        let images: [String]
        let category: String
        let exteriorColor: String
        let interiorColor: String
        let transmission: String
        let fuelType: String
        let condition: String
        let drivetrain: String
        let seats: Int
        let engineSize: String
        let horsepower: String
    }

    // قائمة السيارات
    let cars: [Car] = [
        Car(image: "Audi-2", model: "S5", year: "2025", price: "$50,000", details: "Well maintained", mileage: "10,000 km", brand: "Audi", images: ["Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Red", interiorColor: "Black", transmission: "Automatic", fuelType: "Gasoline", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "2.5L", horsepower: "300"),
        // أضف المزيد من السيارات هنا
    ]

    var body: some View {
        NavigationView {
            List(cars) { car in
                NavigationLink(destination: CarDetailView(car: Car1(
                    model: car.model,
                    brand: car.brand,
                    year: car.year,
                    price: car.price,
                    mileage: car.mileage,
                    images: car.images,
                    category: car.category,
                    exteriorColor: car.exteriorColor,
                    interiorColor: car.interiorColor,
                    transmission: car.transmission,
                    fuelType: car.fuelType,
                    condition: car.condition,
                    drivetrain: car.drivetrain,
                    seats: car.seats,
                    engineSize: car.engineSize,
                    horsepower: car.horsepower
                ))) {
                    HStack {
                        Image(car.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 80)
                            .clipped()
                            .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text("\(car.model) - \(car.year)")
                                .font(.headline)
                            Text("Price: \(car.price)")
                                .font(.subheadline)
                            Text("Mileage: \(car.mileage)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle()) // استخدم StackNavigationViewStyle لتجنب أزرار الرجوع

            .navigationBarHidden(true) // لإخفاء شريط التنقل
        }
    }
}

struct SearchCarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCarView()
    }
}
