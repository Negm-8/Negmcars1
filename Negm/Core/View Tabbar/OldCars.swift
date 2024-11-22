//
//  oldcars.swift
//  Negm
//
//  Created by abdallah negm on 01/11/2024.
//

import SwiftUI

// تعريف بيانات السيارة
struct CarInf: Identifiable {
    let id = UUID()
    let image: String
    let model: String
    let year: String
    let price: String
    let mileage: String? // الميل للسيارات المستعملة أو nil للسيارات الجديدة
    let brand: String // إضافة ماركة السيارة
    let images: [String] // تغيير هنا لاستخدام String بدلاً من UIImage
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

// عرض صفحة السيارات المعروضة للبيع باسم CarSallView
struct OldCars: View {
    // قائمة السيارات المعروضة
    let cars = [
            CarInf(
                image: "Audi-7",
                model: "Audi S5",
                year: "2025",
                price: "80,000 USD",
                mileage: nil,
                brand: "Audi",
                images: ["Audi-2", "Audi-3", "Audi-4", "Audi-5", "Audi-6"], // إضافة الصور المطلوبة
                category: "Sedan",
                exteriorColor: "Blue",
                interiorColor: "Black",
                transmission: "Automatic",
                fuelType: "Petrol",
                condition: "New",
                drivetrain: "AWD",
                seats: 5,
                engineSize: "3.0L",
                horsepower: "367 hp"
            ),
            CarInf(
                image: "Audi-8",
                model: "Mercedes-Benz C200",
                year: "2022",
                price: "20,000 USD",
                mileage: "45,000 km",
                brand: "Mercedes",
                images:["Audi-2", "Audi-3", "Audi-4", "Audi-5", "Audi-6"], // أسماء صور مختلفة للسيارة
                category: "Sedan",
                exteriorColor: "White",
                interiorColor: "Black",
                transmission: "Automatic",
                fuelType: "Petrol",
                condition: "Used",
                drivetrain: "RWD",
                seats: 5,
                engineSize: "2.0L",
                horsepower: "184 hp"
            )
            // أضف سيارات إضافية حسب الحاجة
        ]


    // حالة لتتبع السيارة المحددة
    @State private var selectedCar: CarInf? = nil

    var body: some View {
        NavigationView {
            VStack {
                ForEach(cars) { car in
                    Button(action: {
                        selectedCar = car // تعيين السيارة المحددة
                    }) {
                        HStack(alignment: .top, spacing: 10) {
                            // صورة السيارة
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
                                // عرض اسم السيارة مع السنة
                                Text("\(car.model) \(car.year)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                
                                Text(car.price)
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .foregroundColor(.green)
                                
                                // عرض الحالة (جديدة أو المسافة المقطوعة)
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

                // Spacer at the end to avoid any additional space after the last element
                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.900))
            .fullScreenCover(item: $selectedCar) { car in
                // عرض CarDetailView في وضع كامل الشاشة
                CarDetailView(car: Car1(
                    model: car.model,
                    brand: car.brand,
                    year: car.year,
                    price: car.price,
                    mileage: car.mileage ?? "New",
                    images: car.images, // تمرير أسماء الصور
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
                ))
            }
        }
    }
}

// معاينة التصميم
struct OldCars_Previews: PreviewProvider {
    static var previews: some View {
        OldCars()
    }
}
