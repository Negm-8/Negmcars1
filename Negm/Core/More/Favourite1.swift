//
//  Favorite1.swift
//  Negm
//
//  Created by abdallah negm on 13/11/2024.
//

import SwiftUI

// تعريف هيكل السيارة مع الالتزام بالبروتوكولات لتخزينه بشكل صحيح
struct Car2: Identifiable, Codable {
    let id = UUID()
    let image: String
    let model: String
    let year: String
    let price: String
    let mileage: String?
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
    var isFavourite: Bool
}

struct Favourite1: View {
    @AppStorage("favouriteCars") private var favouriteCarsData: Data = Data() // تخزين السيارات المفضلة
    
    // تحويل البيانات المخزنة من JSON إلى قائمة سيارات
    var favouriteCars: [Car2] {
        get {
            // محاولة فك تشفير البيانات المخزنة من JSON إلى قائمة سيارات
            if let decoded = try? JSONDecoder().decode([Car2].self, from: favouriteCarsData) {
                return decoded
            }
            return []
        }
        set {
            // تحويل قائمة السيارات إلى JSON وتخزينها
            if let encoded = try? JSONEncoder().encode(newValue) {
                favouriteCarsData = encoded
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(favouriteCars) { car in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(car.brand)
                                .font(.headline)
                            Text("\(car.model), \(car.year)")
                                .font(.subheadline)
                            Text("EGP \(car.price)")
                                .font(.body)
                                .foregroundColor(.green)
                            Text("Mileage: \(car.mileage ?? "Unknown")")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            // إزالة السيارة من المفضلة عند الضغط على القلب
                            var updatedCars = favouriteCars
                            
                            // تغيير حالة السيارة بين المفضلة وغير المفضلة
                            if let index = updatedCars.firstIndex(where: { $0.id == car.id }) {
                                updatedCars[index].isFavourite.toggle() // تغيير حالة القلب
                                
                                // إذا كانت السيارة غير مفضلة، نزيلها
                                if !updatedCars[index].isFavourite {
                                    updatedCars.remove(at: index)
                                }
                                // تحديث البيانات المخزنة
//                              	  favouriteCars = updatedCars
                            }
                        }) {
                            Image(systemName: car.isFavourite ? "heart.fill" : "heart")
                                .foregroundColor(car.isFavourite ? .red : .gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("My Favourite Cars") // تعيين عنوان للنفيجيشن بار
        }
    }
}

#Preview {
    Favourite1()
}
