//
//  SubmitCarView.swift
//  Negm
//
//  Created by abdallah negm on 10/09/2024.
//

// هنا صفحه submit الزر الي موجود في صفحه sell بعد اما بخلص اضافه بيانات السياره الي هاتتعرض بضغط علي ده 



//import SwiftUI
//
//// نموذج السيارة
//struct SubmitCarView2: Identifiable {
//    var id = UUID()
//    var carType: String
//    var model: String
//    var year: Int
//    var price: Double
//    var mileage: String
//    var postedBy: String
//    var brand: String
//    var images: [UIImage]
//}
//
//// عرض قائمة السيارات التي قام المستخدم بنشرها
//struct UserPostedCarsView: View {
//    @Binding var postedCars: [SubmitCarView2]
//    
//    var body: some View {
//        NavigationView {
//            List(postedCars) { car in
//                // تحويل SubmitCarView إلى Car1 عند تمريرها إلى CarDetailView
//                NavigationLink(destination: CarDetailView(car: Car1(
//                    model: car.model,
//                    brand: car.brand,
//                    year: "\(car.year)",  // تحويل السنة إلى نص
//                    price: "\(car.price) EGP",  // تحويل السعر إلى نص
//                    mileage: car.mileage,
//                    details: "Details of \(car.model)",  // تفاصيل إضافية (يمكن تعديلها)
//                    images: car.images
//                ))) {
//                    HStack {
//                        // عرض الصورة الأولى من قائمة الصور الخاصة بالسيارة
//                        if let firstImage = car.images.first {
//                            Image(uiImage: firstImage)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 140, height: 80)
//                                .clipped()
//                                .cornerRadius(8)
//                        }
//                        
//
//                        VStack(alignment: .leading) {
//                            Text(car.carType)
//                                .font(.headline)
//                            Text("\(car.model) - \(car.year)")
//                                .font(.subheadline)
//                            Text("Price: \(car.price, specifier: "%.2f") EGP")
//                                .font(.subheadline)
//                            Text("Posted by: \(car.postedBy)")
//                                .font(.subheadline)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("User Posted Cars")
//        }
//    }
//}
//
//// عرض بيانات للمعاينة
//struct UserPostedCarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserPostedCarsView(postedCars: .constant([
//            SubmitCarView2(
//                carType: "SUV",
//                model: "Model X",
//                year: 2020,
//                price: 50000,
//                mileage: "10,000 km",
//                postedBy: "John Doe",
//                brand: "Toyota",
//                images: [UIImage(named: "car1")!, UIImage(named: "car2")!]
//            )
//        ]))
//    }
//}
