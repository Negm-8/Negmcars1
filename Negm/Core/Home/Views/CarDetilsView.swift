
//  CarDetilsView.swift
//  Negm
//
//  Created by abdallah negm on 25/08/2024.
//

import SwiftUI

// نموذج السيارة
struct Car1: Identifiable, Encodable, Decodable {
    var id = UUID() // إضافة معرف فريد إذا كنت لا تستخدمه بالفعل
    var model: String
    var brand: String
    var year: String
    var price: String
    var mileage: String
    var images: [String] // استخدام String للأسماء فقط
    var category: String
    var exteriorColor: String
    var interiorColor: String
    var transmission: String
    var fuelType: String
    var condition: String
    var drivetrain: String
    var seats: Int
    var engineSize: String
    var horsepower: String
}


// عرض تفاصيل السيارة
struct CarDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let car: Car1
    @AppStorage("favouriteCars") private var favouriteCarsData: Data? // جعل البيانات اختيارية
    @State private var showShareSheet = false
    @State private var isFavorite = false
    @State private var isFullScreenImagePresented = false
    @State private var selectedImageIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Divider()

                        // عرض الصور باستخدام HStack
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(car.images.indices, id: \.self) { index in
                                    if let image = UIImage(named: car.images[index]) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .clipped()
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                selectedImageIndex = index
                                                isFullScreenImagePresented = true
                                            }
                                    } else {
                                        // استخدم صورة افتراضية إذا لم تكن الصورة موجودة
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .clipped()
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }

                        Divider()

                        // مربع معلومات السيارة
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("\(car.brand) \(car.model)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("(\(car.year))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 2)

                            Text("Condition: \(car.condition)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            HStack {
                                Text("Price:")
                                    .font(.headline)
                                Spacer()
                                Text(car.price)
                                    .font(.headline)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                        .padding(.horizontal)

                        Divider()

                        // قسم معلومات السيارة
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Car Information")
                                .font(.headline)

                            // عرض المعلومات
                            VStack(spacing: 8) {
                                let info = [
                                    ("Brand:", car.brand),
                                    ("Model:", car.model),
                                    ("Year:", car.year),
                                    ("Category:", car.category),
                                    ("Exterior Color:", car.exteriorColor),
                                    ("Interior Color:", car.interiorColor),
                                    ("Transmission:", car.transmission),
                                    ("Fuel Type:", car.fuelType),
                                    ("Condition:", car.condition),
                                    ("Drivetrain:", car.drivetrain),
                                    ("Seats:", "\(car.seats)"),
                                    ("Engine Size:", car.engineSize),
                                    ("Horsepower:", car.horsepower)
                                ]

                                ForEach(info, id: \.0) { item in
                                    HStack {
                                        Text(item.0)
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(item.1)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                        .padding(.horizontal)

                        Divider()
                    }
                    .padding(.vertical)
                }

                // شريط الاتصال الثابت في الأسفل
                VStack {
                    Divider()

                    HStack(spacing: 16) {
                        Button(action: {
                            print("Call button pressed")
                        }) {
                            Label("Call", systemImage: "phone.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }

                        Button(action: {
                            print("Message button pressed")
                        }) {
                            Label("Message", systemImage: "message.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color(.systemBackground))
            }
            .navigationBarItems(leading: HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                }
            }, trailing: HStack(spacing: 16) {
                Button(action: {
                    // إضافة أو إزالة السيارة من المفضلة
                    isFavorite.toggle()
                    updateFavouriteCars()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(isFavorite ? .red : .blue)
                }

                Button(action: {
                    showShareSheet = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundColor(.blue)
                }
            })
            .navigationBarBackButtonHidden(true)
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["Check out this car: \(car.brand) \(car.model) for \(car.price)"])
            }
            .fullScreenCover(isPresented: $isFullScreenImagePresented) {
                FullScreenImageView(images: car.images, selectedImageIndex: $selectedImageIndex)
            }
        }
    }

    // وظيفة لتحديث السيارات المفضلة
    func updateFavouriteCars() {
        // جلب السيارات المفضلة المخزنة
        var favouriteCars = loadFavouriteCars()

        if isFavorite {
            // إضافة السيارة إلى المفضلة إذا لم تكن موجودة
            favouriteCars.append(car)
        } else {
            // إزالة السيارة إذا كانت مفضلة بالفعل
            favouriteCars.removeAll { $0.model == car.model && $0.year == car.year }
        }

        // تحديث البيانات المخزنة
        saveFavouriteCars(favouriteCars)
    }

    // تحميل السيارات المفضلة من البيانات المخزنة
    func loadFavouriteCars() -> [Car1] {
        if let data = favouriteCarsData,
           let decoded = try? JSONDecoder().decode([Car1].self, from: data) {
            return decoded
        }
        return []
    }

    // حفظ السيارات المفضلة
    func saveFavouriteCars(_ cars: [Car1]) {
        if let encoded = try? JSONEncoder().encode(cars) {
            favouriteCarsData = encoded
        }
    }
}


// مكون ورقة المشاركة
struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// عرض الصور بملء الشاشة مع خاصية التكبير والتصغير وزر الإغلاق
struct FullScreenImageView: View {
    var images: [String] // استخدام String للأسماء فقط
    @Binding var selectedImageIndex: Int
    @Environment(\.presentationMode) var presentationMode

    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $selectedImageIndex) {
                ForEach(images.indices, id: \.self) { index in
                    if let image = UIImage(named: images[index]) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .gesture(MagnificationGesture()
                                .onChanged { value in
                                    scale = lastScale * value
                                }
                                .onEnded { value in
                                    lastScale = scale
                                }
                            )
                            .tag(index)
                    } else {
                        // عرض صورة افتراضية إذا لم تكن الصورة موجودة
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            .foregroundColor(.gray)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)

            // زر الإغلاق
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

// مثال لاختبار العرض
struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CarDetailView(car: Car1(
                model: "S5",
                brand: "Audi",
                year: "2025",
                price: "$90,000",
                mileage: "0",
                images: [
                    "Audi-1", "Audi-2", "Audi-3",
                    "Audi-4", "Audi-5", "Audi-6",
                    "Audi-7", "Audi-8", "Audi-9",
                    "Audi-10", "Audi-11", "Audi-12",
                    "Audi-13", "Audi-14", "Audi-15",
                    "Audi-16", "Audi-17", "Audi-18",
                    "Audi-19", "Audi-20", "Audi-21",
                    "Audi-22", "Audi-23", "Audi-24",
                    "Audi-25", "Audi-26", "Audi-27"
                ],
                category: "Sport",
                exteriorColor: "Black",
                interiorColor: "Red",
                transmission: "Automatic",
                fuelType: "Petrol",
                condition: "New",
                drivetrain: "AWD",
                seats: 4,
                engineSize: "3.0L",
                horsepower: "350"
            ))
        }
    }
}

