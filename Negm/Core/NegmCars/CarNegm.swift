//
//  CarViewNegm.swift
//  Negm
//
//  Created by abdallah negm on 07/11/2024.
//

import SwiftUI

// تعريف بيانات السيارة
struct CarNegm: Identifiable {
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
struct CarNegmCars: View {
        // قائمة السيارات المعروضة
    let cars = [
        
        CarNegm(image: "y", model: "BMW 7 Mansoury", year: "2023", price: "400,000 USD", mileage: nil, brand: "BMW", images: ["q", "w", "e", "r", "t", "u", "i", "y"], category: "Sedan", exteriorColor: "black", interiorColor: "white", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "4,4L", horsepower: "544 HP" ),
        CarNegm(image: "p", model: "Mansoury G63 6x6 ", year: "2024", price: "1.6M USD", mileage: nil, brand: "Mercedes", images: ["a", "s", "d", "f", "g", "h", "j", "k", "l", "p"], category: "6x6", exteriorColor: "White", interiorColor: "green", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "6WD", seats: 4, engineSize: "4.4L", horsepower: "900 HP"),
        CarNegm(image: "z", model: "Rolls Royce Mansory Phantom", year: "2024", price: "1.5M USD", mileage: nil, brand: "Rolls Royce", images: ["z", "x", "c", "v", "b", "n", "m", ",", "."], category: "Sedan", exteriorColor: "Black", interiorColor: "Black,orang ", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 4, engineSize: "6.75L", horsepower: "610 HP"),
        CarNegm(image: "tt", model: "Ferrari 812 GTS Mansoury", year: "2024", price: "1M USD", mileage: "0 km", brand: "Ferrari", images: ["qq", "ww", "ee", "rr", "tt", "yy", "uu", "ii", "oo", "pp"], category: "coupe", exteriorColor: "gray", interiorColor: "black", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "RWD", seats: 2, engineSize: "6.5L", horsepower: "830 HP"),
        CarNegm(image: "zz", model: "Lamborghini Urus Venatus S P900 Mansoury", year: "2024", price: "1.3M USD", mileage: nil, brand: "Lamborghini", images: ["zz", "xx", "cc", "vv", "bb", "nn", "mm", ",,", "..", "..."], category: "SUV", exteriorColor: "Black,green", interiorColor: "green", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "4.0L", horsepower: "900 HP"),
        CarNegm(image: "jj", model: " BRABUS SL GTS ROCKET", year: "2024", price: "1M USD", mileage: nil, brand: "mercedes", images: ["aa", "ss", "dd", "ff", "gg", "hh", "jj", "kk", "ll", ";;", "''"], category: "Coupe", exteriorColor: "Black", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 2, engineSize: "4.5L", horsepower: "1000 HP"),
        CarNegm(image: "222", model: "BRABUS Rolls-Royce Cullinan", year: "2024", price: "1M USD", mileage: nil, brand: "Rolls-Royce", images: ["111", "222", "333", "444", "555", "666", "777", "888", "999", "14"], category: "SUV", exteriorColor: "Black", interiorColor: "green", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "6.2L", horsepower: "700 hp"),
        CarNegm(image: "ttt", model: "Mercedes S930 BRABUS", year: "2024", price: "90,000 USD", mileage: nil, brand: "Mercedes-benz", images: ["qqq", "www", "eee", "rrr", "ttt", "yyy", "uuu", "iii"], category: "Sedan", exteriorColor: "Black", interiorColor: "green", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "4.0 L", horsepower: "930 HP"),
        CarNegm(image: "sss", model: "Brabus G63 AMG 4x4 ", year: "2024", price: "1M USD", mileage: nil, brand: "Mercedes-benz", images: ["aaa", "sss", "ddd", "fff", "ggg", "hhh", "jjj", "kkk", "lll"], category: "Sedan", exteriorColor: "Gray", interiorColor: "Black", transmission: "Automatic", fuelType: "Petrol", condition: "New", drivetrain: "AWD", seats: 5, engineSize: "4.0L", horsepower: "850 HP"),
        CarNegm(image: "z6", model: "BMW M5CS", year: "2022", price: "145,000 USD", mileage: nil, brand: "BMW", images: ["z0", "z1", "z2", "z3", "z4", "z5", "z6", "z7", "z8", "z9", "z11", "z22", "z33"], category: "Sedan", exteriorColor: "Gray", interiorColor: "Black,Red", transmission: "Automatic", fuelType: "Petrol", condition: "Used", drivetrain: "AWD", seats: 4, engineSize: "4.4L", horsepower: "635 HP")
            ]
        


    // حالة لتتبع السيارة المحددة
    @State private var selectedCar: CarNegm? = nil

    var body: some View {
           NavigationView {
               ScrollView {
                   LazyVStack(spacing: 10) { // استخدام LazyVStack للتمرير المتسلسل
                       ForEach(cars) { car in
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

                                   VStack(alignment: .leading, spacing: 5) {
                                       Text("\(car.model) \(car.year)")
                                           .font(.system(size: 17, weight: .bold, design: .rounded))
                                           .foregroundColor(Color.black)
                                           .lineLimit(2)
                                       
                                       Text(car.price)
                                           .font(.system(size: 16, weight: .semibold, design: .rounded))
                                           .foregroundColor(.green)
                                       
                                       if let mileage = car.mileage {
                                           Text("Mileage: \(mileage)")
                                               .font(.system(size: 15))
                                               .foregroundColor(.gray)
                                       } else {
                                           Text("New")
                                               .font(.system(size: 15))
                                               .foregroundColor(.gray)
                                       }
                                   }
                                   Spacer()
                               }
                               .padding(12)
                               .background(
                                   RoundedRectangle(cornerRadius: 15)
                                       .fill(Color.white)
                                       .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                               )
                               .padding(.horizontal, 7)
                           }
                       }
                   }
                   .padding(.vertical, 8)
               }
               
               .background(Color.gray.opacity(2).ignoresSafeArea()) // توسيع الخلفية لتغطي الشاشة بالكامل
               .fullScreenCover(item: $selectedCar) { car in
                   CarDetailView(car: Car1(
                       model: car.model,
                       brand: car.brand,
                       year: car.year,
                       price: car.price,
                       mileage: car.mileage ?? "New",
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
                   ))
               }
           }
       }
   }

   // معاينة التصميم
   struct CarNegm_Previews: PreviewProvider {
       static var previews: some View {
           CarNegmCars()
       }
   }
