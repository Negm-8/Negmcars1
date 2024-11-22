//
//  CarDetails.swift
//  Negm
//
//  Created by abdallah negm on 07/11/2024.
//


import SwiftUI

// تعريف بيانات السيارة
struct CarDetails: Identifiable {
    let id = UUID()
    let image: String
    let model: String
    let year: String
    let price: String
    let mileage: String? // الميل للسيارات المستعملة أو nil للسيارات الجديدة
    let brand: String // ماركة السيارة
    let images: [String] // الصور الإضافية للسيارة
    let category: String // فئة السيارة
    let exteriorColor: String // لون السيارة الخارجي
    let interiorColor: String // لون السيارة الداخلي
    let transmission: String // نوع النقل
    let fuelType: String // نوع الوقود
    let condition: String // حالة السيارة (جديدة / مستعملة)
    let drivetrain: String // نظام الدفع
    let seats: Int // عدد المقاعد
    let engineSize: String // حجم المحرك
    let horsepower: String // قوة المحرك
}

// عرض صفحة السيارات المعروضة للبيع
struct CarListingView: View {
    // قائمة السيارات المعروضة
    let carListings = [
        CarDetails(image: "Audi-7", model: "Audi S5", year: "2025", price: "80,000 USD", mileage: nil, brand: "Audi", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Blue", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "3.0L", horsepower: "367 hp"),
        CarDetails(image: "Audi-8", model: "Mercedes-Benz C200", year: "2022", price: "20,000 USD", mileage: "45,000 km", brand: "Mercedes", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "White", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "RWD", seats: 5, engineSize: "2.0L", horsepower: "184 hp"),
        CarDetails(image: "Audi-9", model: "BMW 330i", year: "2021", price: "25,000 USD", mileage: "30,000 km", brand: "BMW", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Gray", interiorColor: "Beige", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "RWD", seats: 5, engineSize: "2.0L", horsepower: "255 hp"),
        CarDetails(image: "Audi-10", model: "Toyota Corolla", year: "2023", price: "18,000 USD", mileage: "10,000 km", brand: "Toyota", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Silver", interiorColor: "Gray", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "FWD", seats: 5, engineSize: "1.8L", horsepower: "139 hp"),
        CarDetails(image: "Audi-11", model: "Honda Accord", year: "2024", price: "28,000 USD", mileage: nil, brand: "Honda", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Black", interiorColor: "Black", transmission: "Automatic", fuelType: "Hybrid", condition: "New", drivetrain: "FWD", seats: 5, engineSize: "2.0L", horsepower: "212 hp"),
        CarDetails(image: "Audi-12", model: "Ford Mustang", year: "2020", price: "35,000 USD", mileage: "25,000 km", brand: "Ford", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Coupe", exteriorColor: "Red", interiorColor: "Black", transmission: "Manual", fuelType: "Petrol", condition: "Used", drivetrain: "RWD", seats: 4, engineSize: "5.0L", horsepower: "450 hp"),
        CarDetails(image: "Audi-13", model: "Chevrolet Camaro", year: "2019", price: "30,000 USD", mileage: "50,000 km", brand: "Chevrolet", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Coupe", exteriorColor: "Yellow", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "RWD", seats: 4, engineSize: "6.2L", horsepower: "455 hp"),
        CarDetails(image: "Audi-14", model: "Tesla Model S", year: "2023", price: "90,000 USD", mileage: nil, brand: "Tesla", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "White", interiorColor: "Black", transmission: "Automatic", fuelType: "Electric", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "Electric", horsepower: "1020 hp"),
        CarDetails(image: "Audi-15", model: "Nissan Altima", year: "2018", price: "15,000 USD", mileage: "60,000 km", brand: "Nissan", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Blue", interiorColor: "Gray", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "FWD", seats: 5, engineSize: "2.5L", horsepower: "188 hp"),
        CarDetails(image: "Audi-16", model: "Hyundai Sonata", year: "2021", price: "22,000 USD", mileage: "40,000 km", brand: "Hyundai", images: ["Audi-2", "Audi-3", "Audi-4"], category: "Sedan", exteriorColor: "Gray", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "FWD", seats: 5, engineSize: "2.5L", horsepower: "191 hp")
    ]

    @State private var selectedCar: CarDetails? = nil

    var body: some View {
        NavigationView {
            VStack {
                ForEach(carListings) { car in
                    Button(action: {
                        selectedCar = car
                    }) {
                        HStack(alignment: .top, spacing: 10) {
                            Image(car.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 120)
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)

                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(car.model) \(car.year)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)

                                Text(car.price)
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .foregroundColor(.green)

                                if let mileage = car.mileage {
                                    Text("Mileage: \(mileage)")
                                        .font(.system(size: 14, weight: .regular, design: .rounded))
                                        .foregroundColor(.gray)
                                } else {
                                    Text("New")
                                        .font(.system(size: 14, weight: .regular, design: .rounded))
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                        )
                        .padding(.horizontal, 9)
                    }
                }
                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.900))
            .fullScreenCover(item: $selectedCar) { car in
                CarDetailView(car: car)
            }
        }
    }
}

// معاينة التصميم
struct CarListingView_Previews: PreviewProvider {
    static var previews: some View {
        CarListingView()
    }
}
