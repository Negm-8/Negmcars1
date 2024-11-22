    //
    //  SellView.swift
    //  Negm
    //
    //  Created by abdallah negm on 20/08/2024.
    //

// هنا هايكون في تطبيق البائع ودي صفحه بيع السياره و تقديم خدمه ودي صفحه sell , Add Service ودي الي بضيف  فيها بيانات السياره والصور وهكذا

//import SwiftUI
//import PhotosUI
//
//    struct AddView2: View {
//        var body: some View {
//            NavigationView {
//                ZStack {
//                    Color.gray.ignoresSafeArea()
//                    
//                    VStack(spacing: 20) {
//                        HStack(spacing: 20) {
//                            NavigationLink(destination: AddCarView()) {
//                                Text("Sell")
//                                    .frame(width: 160, height: 160)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(19)
//                                    .font(.headline)
//                                    .multilineTextAlignment(.center)
//                            }
//                            NavigationLink(destination: AddServiceView()) {
//                                Text("Add Service")
//                                    .frame(width: 160, height: 160)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(19)
//                                    .font(.headline)
//                                    .multilineTextAlignment(.center)
//                            }
//                        }
//                        
//                        Spacer()
//                    }
//                    .padding()
//                }
//                .navigationTitle("Add")
//            }
//        }
//    }
//    struct AddCarView: View {
//        @State private var selectedMarka: String? = nil
//        @State private var selectedModel: String? = nil
//        @State private var selectedYear: String? = nil
//        @State private var selectedMileage: String? = nil
//
//        @State private var makeOptions: [String] = [
//                                        "Toyota", "Honda", "Ford", "BMW", "Mercedes", "Nissan", "Chevrolet", "Kia", "Hyundai", "Volkswagen",
//                                        "Audi", "Lexus", "Mazda", "Subaru", "Dodge", "Jeep", "Tesla", "Volvo", "Land Rover", "Jaguar",
//                                        "Ferrari", "Lamborghini", "Porsche", "Mitsubishi", "Acura", "Infiniti", "Mini", "Bentley", "Buick",
//                                        "Cadillac", "Chrysler", "Fiat", "Genesis", "GMC", "Lincoln", "Maserati", "Peugeot", "Renault", "Rolls-Royce",
//                                        "Suzuki", "Tata", "Alfa Romeo", "Aston Martin", "Citroen", "DS Automobiles", "Hummer", "Isuzu", "Lancia", "Saab",
//                                        "Scion", "Seat", "Skoda", "Smart", "SsangYong"
//        ].sorted()
//            
//        @State private var makeModels: [String: [String]] = [
//            "Acura": ["ILX", "TLX", "RLX", "RDX", "MDX", "NSX", "ZDX", "Integra Type R"],
//              "Alfa Romeo": ["Giulia", "Stelvio", "4C", "8C", "Spider", "GTV", "Giulia Quadrifoglio"],
//              "Aston Martin": ["DB11", "Vantage", "DBX", "DB9", "Rapide", "Valkyrie", "Vanquish"],
//              "Audi": ["A3", "A4", "A6", "Q3", "Q5", "Q7", "A5", "A8", "Q8", "R8", "TT", "RS6", "RS7"],
//              "Bentley": ["Continental", "Flying Spur", "Bentayga", "Mulsanne", "Arnage", "Azure", "Continental GT"],
//              "BMW": ["3 Series", "5 Series", "7 Series", "X1", "X3", "X5", "X6", "X7", "i3", "i8", "Z4", "M3", "M4", "M5"],
//              "Buick": ["Enclave", "Encore", "Envision", "LaCrosse", "Regal", "Verano", "Grand National"],
//              "Cadillac": ["ATS", "CTS", "XT5", "Escalade", "XT4", "XT6", "XTS", "SRX", "CTS-V"],
//              "Chevrolet": ["Spark", "Malibu", "Impala", "Equinox", "Tahoe", "Silverado", "Camaro", "Corvette", "Traverse", "Suburban", "Trailblazer", "SS"],
//              "Chrysler": ["200", "300", "Pacifica", "Aspen", "Voyager", "Sebring", "PT Cruiser", "300 SRT"],
//              "Citroen": ["C3", "C4", "C5 Aircross", "C1", "C5", "C6", "DS4", "C4 VTS"],
//              "Dodge": ["Challenger", "Charger", "Durango", "Journey", "Grand Caravan", "Ram", "Viper", "Dart", "Avenger", "Magnum", "Hellcat"],
//              "DS Automobiles": ["DS 3", "DS 7", "DS 9", "DS 4", "DS 5", "DS 3 Performance"],
//              "Ferrari": ["488", "F8", "Portofino", "Roma", "812", "SF90", "GTC4Lusso", "LaFerrari", "Monza"],
//              "Fiat": ["500", "500X", "Panda", "Tipo", "124 Spider", "Bravo", "Punto", "Abarth 595", "Abarth 124 Spider"],
//              "Ford": ["Fiesta", "Focus", "Mustang", "Explorer", "F-150", "Ranger", "Fusion", "Escape", "Edge", "Expedition", "Bronco", "Maverick", "EcoSport", "GT"],
//              "Genesis": ["G70", "G80", "G90", "GV70", "GV80", "Essentia"],
//              "GMC": ["Acadia", "Terrain", "Yukon", "Sierra", "Canyon", "Savanna", "Syclone"],
//              "Honda": ["Civic", "Accord", "Fit", "CR-V", "Pilot", "Ridgeline", "HR-V", "Odyssey", "Passport", "Civic Type R", "NSX"],
//              "Hummer": ["H1", "H2", "H3", "EV"],
//              "Hyundai": ["Elantra", "Sonata", "Tucson", "Santa Fe", "Palisade", "Veloster", "Kona", "Ioniq", "Venue", "Veloster N"],
//              "Infiniti": ["Q50", "Q60", "Q70", "QX50", "QX60", "QX80", "Q30", "QX30", "Q60 Red Sport 400"],
//              "Isuzu": ["D-Max", "MU-X", "Trooper", "Rodeo"],
//              "Jaguar": ["XE", "XF", "XJ", "F-Pace", "E-Pace", "I-Pace", "F-Type", "XK"],
//              "Jeep": ["Wrangler", "Cherokee", "Grand Cherokee", "Compass", "Renegade", "Gladiator", "Patriot", "Commander", "Liberty", "Grand Cherokee SRT"],
//              "Kia": ["ELKOPTAN","Rio", "Optima", "Sportage", "Sorento", "Telluride", "Stinger", "Forte", "Soul", "Seltos", "K5", "Carnival", "Stinger GT"],
//              "Lamborghini": ["Huracan", "Aventador", "Urus", "Gallardo", "Murcielago", "Diablo", "Countach"],
//              "Lancia": ["Ypsilon", "Delta", "Thema", "Stratos"],
//              "Land Rover": ["Range Rover", "Range Rover Sport", "Discovery", "Defender", "Range Rover Velar", "Range Rover Evoque", "SVR"],
//              "Lexus": ["IS", "ES", "GS", "RX", "NX", "LX", "UX", "GX", "RC", "LS", "LFA"],
//              "Lincoln": ["MKC", "MKZ", "Navigator", "Corsair", "Aviator", "Continental", "MKX", "MKT"],
//              "Maserati": ["Ghibli", "Levante", "Quattroporte", "GranTurismo", "GranCabrio", "MC20"],
//              "Mazda": ["Mazda3", "Mazda6", "CX-3", "CX-5", "CX-9", "MX-5", "CX-30", "RX-7", "RX-8"],
//              "Mercedes": ["A-Class", "C-Class", "E-Class", "S-Class", "GLA", "GLE", "GLC", "CLS", "G-Class", "SL-Class", "GLS", "AMG GT", "AMG C63"],
//              "Mini": ["Cooper", "Countryman", "Clubman", "Paceman", "John Cooper Works"],
//              "Mitsubishi": ["Mirage", "Lancer", "Outlander", "Pajero", "Eclipse Cross", "ASX", "L200", "Lancer Evolution"],
//              "Nissan": ["Altima", "Sentra", "Maxima", "Rogue", "Murano", "Pathfinder", "370Z", "GT-R", "Juke", "Kicks", "Versa", "Nismo"],
//              "Peugeot": ["208", "308", "508", "2008", "3008", "5008", "207", "307", "407", "RCZ"],
//              "Porsche": ["911", "Cayenne", "Macan", "Panamera", "Taycan", "718 Boxster", "718 Cayman"],
//              "Renault": ["Clio", "Megane", "Kadjar", "Koleos", "Talisman", "Captur", "Duster", "Megane RS"],
//              "Rolls-Royce": ["Ghost", "Wraith", "Dawn", "Phantom", "Cullinan", "Silver Shadow", "Silver Spur"],
//              "Saab": ["9-3", "9-5", "9-4X", "900"],
//              "Scion": ["tC", "FR-S", "iQ", "xB", "xD"],
//              "Seat": ["Ibiza", "Leon", "Ateca", "Arona", "Tarraco", "Cupra"],
//              "Skoda": ["Octavia", "Superb", "Kodiaq", "Kamiq", "Karoq", "Scala", "RS"],
//              "Smart": ["Fortwo", "Forfour", "Roadster"],
//              "SsangYong": ["Tivoli", "Korando", "Rexton", "Musso", "Actyon"],
//              "Subaru": ["Impreza", "Legacy", "Outback", "Forester", "Crosstrek", "Ascent", "BRZ", "WRX", "STI"],
//              "Suzuki": ["Swift", "Vitara", "Jimny", "Celerio", "Baleno", "Ignis", "S-Cross", "Swift Sport"],
//              "Tata": ["Tiago", "Nexon", "Harrier", "Safari", "Hexa", "Altroz"],
//              "Tesla": ["Model S", "Model 3", "Model X", "Model Y", "Roadster", "Cybertruck"],
//              "Toyota": ["Corolla", "Camry", "Prius", "Yaris", "Highlander", "Land Cruiser", "Supra", "4Runner", "RAV4", "Tacoma", "Tundra", "C-HR", "86", "GR Yaris"],
//            "Volkswagen": ["Golf", "Passat", "Jetta", "Tiguan", "Atlas", "Arteon", "Beetle", "Touareg", "Polo", "ID.4", "Golf GTI", "Golf R"],
//              "Volvo": ["S60", "S90", "V60", "XC40", "XC60", "XC90", "V90", "S40", "Polestar 1", "Polestar 2"]
//
//        ].sorted(by: { $0.key < $1.key }).reduce(into: [String: [String]]()) { (result, pair) in
//            result[pair.key] = pair.value
//        }
//
//        
//        @State private var years: [String] = ["2020", "2021", "2022", "2023", "2024", "2025"]
//        
//        @State private var mileageOptions: [String] = [
//            "0 - 500","500 - 1000", "1000 - 10000", "10000 - 30000", "30000 - 500000","50000 - 100000"
//        ]
//        
//        @State private var showMakes = false
//        @State private var showModels = false
//        @State private var showYears = false
//        @State private var showMileages = false
//        
//        @State private var make: String = ""
//        @State private var model: String = ""
//        @State private var price: String = ""
//        @State private var year: String = ""
//        @State private var mileage: String = ""
//        @State private var description: String = ""
//        
//        @State private var selectedImages: [UIImage] = []
//        @State private var showImagePicker = false
//        @State private var showAlert = false
//        @State private var showQuestionAlert = false
//        @State private var navigateToPostedCars = false
//        @State private var postedCars: [SubmitCarView2] = [] // Or load from your data source
//        
//        var body: some View {
//            Form {
//                Section(header: Text("")) {
//                    Button(action: { showMakes.toggle() }) {
//                        HStack {
//                            Text("Marka")
//                            Spacer()
//                            Text(selectedMarka ?? "Select Marka")
//                        }
//                    }
//                    .actionSheet(isPresented: $showMakes) {
//                        ActionSheet(
//                            title: Text("Select Make"),
//                            buttons: makeOptions.map { make in
//                                    .default(Text(make)) {
//                                        self.selectedMarka = make
//                                        self.selectedModel = nil
//                                        showModels = true
//                                    }
//                            } + [.cancel()]
//                        )
//                    }
//                    
//                    if let selectedMarka = selectedMarka {
//                        Button(action: { showModels.toggle() }) {
//                            HStack {
//                                Text("Model")
//                                Spacer()
//                                Text(selectedModel ?? "Select Model")
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        .actionSheet(isPresented: $showModels) {
//                            let models = makeModels[selectedMarka] ?? []
//                            return ActionSheet(
//                                title: Text("Select Model"),
//                                buttons: models.map { model in
//                                        .default(Text(model)) {
//                                            self.selectedModel = model
//                                        }
//                                } + [.cancel()]
//                            )
//                        }
//                    }
//                    
//                    Button(action: { showYears.toggle() }) {
//                        HStack {
//                            Text("Year")
//                            Spacer()
//                            Text(selectedYear ?? "Select Year")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    .actionSheet(isPresented: $showYears) {
//                        ActionSheet(
//                            title: Text("Select Year"),
//                            buttons: years.map { year in
//                                    .default(Text(year)) {
//                                        self.selectedYear = year
//                                    }
//                            } + [.cancel()]
//                        )
//                    }
//                    
//                    Button(action: { showMileages.toggle() }) {
//                        HStack {
//                            Text("KM")
//                            Spacer()
//                            Text(selectedMileage ?? "Distance traveled")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    .actionSheet(isPresented: $showMileages) {
//                        ActionSheet(
//                            title: Text("Select Mileage"),
//                            buttons: mileageOptions.map { mileage in
//                                    .default(Text(mileage)) {
//                                        self.selectedMileage = mileage
//                                    }
//                            } + [.cancel()]
//                        )
//                    }
//                    
//                    TextField("Price", text: $price)
//                        .keyboardType(.numberPad)
//                        .onChange(of: price) { newValue in
//                            // Restrict input to 8 characters
//                            if newValue.count > 8 {
//                                price = String(newValue.prefix(8))
//                            }
//                        }
//                    
//                    ScrollView(.vertical) {
//                        TextEditor(text: $description)
//                            .frame(height: 140)  // Adjust the height as needed
//                            .padding(8)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(8)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 8)
//                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//                            )
//                    }
//                    .frame(height: 140) // Ensure ScrollView takes the same height as TextEditor
//
//                    
//                    Button(action: {
//                        self.showQuestionAlert = true
//                    }) {
//                        Text("Add Images")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                    .alert(isPresented: $showQuestionAlert) {
//                        Alert(
//                            title: Text("Add Images"),
//                            message: Text("Would you like to add photos from your gallery?"),
//                            primaryButton: .default(Text("Photo Library")) {
//                                self.showImagePicker = true
//                            },
//                            secondaryButton: .cancel()
//                        )
//                    }
//                    
//                    Button(action: {
//                        if let make = selectedMarka, let model = selectedModel, let year = selectedYear, let mileage = selectedMileage, !price.isEmpty, !description.isEmpty {
//                            navigateToPostedCars = true
//                        } else {
//                            showAlert = true
//                        }
//                    }) {
//                        Text("Submit")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                    .padding()
//
//                    
//                    
////هنا المكان الفاضي الي ظاهر تحت submit
//                    alert(isPresented: $showAlert) {
//                        Alert(title: Text("Missing Information"), message: Text("Please fill in all required fields."))
//                    }
//                }
//                .navigationTitle("Add Car")
//                .sheet(isPresented: $showImagePicker) {
//                    PHPickerViewControllerWrapper(selectedImages: $selectedImages)
//                }
//            }
//        }
//        struct SubmitCarView: View {
//                 var body: some View {
//                     Text("Submit Car View")
//                 }
//             }
//        
//        func saveCarData() {
//            // Implement the function to save car data
//            print("Car Data Submitted: \(make), \(model), \(price), \(year), \(mileage), \(description), \(selectedImages.count) images")
//        }
//    }
//
//    struct AddView2_Previews: PreviewProvider {
//        static var previews: some View {
//            AddView2()
//        }
//    }
//    struct AddServiceView: View {
//        var body: some View {
//            ScrollView {
//                VStack(spacing: 15) {
//                    Button(action: {
//                        // Action for "View Cars for Rent"
//                    }) {
//                        Text("View Cars for Rent")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                            .font(.headline)
//                    }
//                    
//                    Button(action: {
//                        // Action for "Airport Transfer"
//                    }) {
//                        Text("Airport Transfer")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                            .font(.headline)
//                    }
//                    
//                    Button(action: {
//                        // Action for "Intercity Minibus"
//                    }) {
//                        Text("Intercity Minibus")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                            .font(.headline)
//                    }
//                    
//                    Button(action: {
//                        // Action for "Wedding Cars"
//                    }) {
//                        Text("Wedding Cars")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                            .font(.headline)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Add Service")
//            .background(Color.gray.ignoresSafeArea())
//        }
//    }
//
//    struct PostedCarsView: View {
//          @Binding var postedCars: [SubmitCarView2]
//          
//          var body: some View {
//              List(postedCars) { car in
//                  Text(car.carType)
//              }
//              .navigationTitle("Your Posted Cars")
//          }
//      }
//
//    struct PHPickerViewControllerWrapper: UIViewControllerRepresentable {
//        @Binding var selectedImages: [UIImage]
//        
//        func makeCoordinator() -> Coordinator {
//            Coordinator(self)
//        }
//        
//        func makeUIViewController(context: Context) -> PHPickerViewController {
//            var config = PHPickerConfiguration()
//            config.selectionLimit = 0 // Allow unlimited selection
//            config.filter = .images // Filter to only images
//            
//            let picker = PHPickerViewController(configuration: config)
//            picker.delegate = context.coordinator
//            return picker
//        }
//        
//        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
//            // No updates needed
//        }
//        
//        class Coordinator: NSObject, PHPickerViewControllerDelegate {
//            var parent: PHPickerViewControllerWrapper
//            
//            init(_ parent: PHPickerViewControllerWrapper) {
//                self.parent = parent
//            }
//            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//                parent.selectedImages.removeAll()
//                
//                let dispatchGroup = DispatchGroup()
//                
//                for result in results {
//                    dispatchGroup.enter()
//                    
//                    if result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
//                        result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
//                            if let image = image as? UIImage {
//                                self.parent.selectedImages.append(image)
//                            }
//                            dispatchGroup.leave()
//                        }
//                    } else {
//                        dispatchGroup.leave()
//                    }
//                }
//                dispatchGroup.notify(queue: .main) {
//                    picker.dismiss(animated: true)
//                }
//            }
//        }
//    }
//
