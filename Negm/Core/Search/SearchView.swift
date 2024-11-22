




import SwiftUI

struct SearchView: View {
    
    @State private var carMake: String = ""
    @State private var carModel: String = ""
    @State private var yearFrom: String = ""
    @State private var yearTo: String = ""
    @State private var distanceFrom: String = ""
    @State private var distanceTo: String = ""
    
    @State private var showCarMakePicker = false
    @State private var showCarModelPicker = false
    
    @State private var condition: String = "New"
    @State private var showMileagePicker = false
    @State private var selectedMileage: String = ""
    
    @State private var navigateToSearchCarView = false // Add this state
    
    let carMakes = [
                   "Toyota", "Honda", "Ford", "BMW", "Mercedes", "Nissan", "Chevrolet", "Kia", "Hyundai", "Volkswagen",
                   "Audi", "Lexus", "Mazda", "Subaru", "Dodge", "Jeep", "Tesla", "Volvo", "Land Rover", "Jaguar",
                   "Ferrari", "Lamborghini", "Porsche", "Mitsubishi", "Acura", "Infiniti", "Mini", "Bentley", "Buick",
                   "Cadillac", "Chrysler", "Fiat", "Genesis", "GMC", "Lincoln", "Maserati", "Peugeot", "Renault", "Rolls-Royce",
                   "Suzuki", "Tata", "Alfa Romeo", "Aston Martin", "Citroen", "DS Automobiles", "Hummer", "Isuzu", "Lancia", "Saab",
                   "Scion", "Seat", "Skoda", "Smart", "SsangYong"
               ]
        
               let carModels: [String: [String]] = [
                "Acura": ["ILX", "TLX", "RLX", "RDX", "MDX", "NSX", "ZDX", "Integra Type R"],
                  "Alfa Romeo": ["Giulia", "Stelvio", "4C", "8C", "Spider", "GTV", "Giulia Quadrifoglio"],
                  "Aston Martin": ["DB11", "Vantage", "DBX", "DB9", "Rapide", "Valkyrie", "Vanquish"],
                  "Audi": ["A3", "A4", "A6", "Q3", "Q5", "Q7", "A5", "A8", "Q8", "R8", "TT", "RS6", "RS7"],
                  "Bentley": ["Continental", "Flying Spur", "Bentayga", "Mulsanne", "Arnage", "Azure", "Continental GT"],
                  "BMW": ["3 Series", "5 Series", "7 Series", "X1", "X3", "X5", "X6", "X7", "i3", "i8", "Z4", "M3", "M4", "M5"],
                  "Buick": ["Enclave", "Encore", "Envision", "LaCrosse", "Regal", "Verano", "Grand National"],
                  "Cadillac": ["ATS", "CTS", "XT5", "Escalade", "XT4", "XT6", "XTS", "SRX", "CTS-V"],
                  "Chevrolet": ["Spark", "Malibu", "Impala", "Equinox", "Tahoe", "Silverado", "Camaro", "Corvette", "Traverse", "Suburban", "Trailblazer", "SS"],
                  "Chrysler": ["200", "300", "Pacifica", "Aspen", "Voyager", "Sebring", "PT Cruiser", "300 SRT"],
                  "Citroen": ["C3", "C4", "C5 Aircross", "C1", "C5", "C6", "DS4", "C4 VTS"],
                  "Dodge": ["Challenger", "Charger", "Durango", "Journey", "Grand Caravan", "Ram", "Viper", "Dart", "Avenger", "Magnum", "Hellcat"],
                  "DS Automobiles": ["DS 3", "DS 7", "DS 9", "DS 4", "DS 5", "DS 3 Performance"],
                  "Ferrari": ["488", "F8", "Portofino", "Roma", "812", "SF90", "GTC4Lusso", "LaFerrari", "Monza"],
                  "Fiat": ["500", "500X", "Panda", "Tipo", "124 Spider", "Bravo", "Punto", "Abarth 595", "Abarth 124 Spider"],
                  "Ford": ["Fiesta", "Focus", "Mustang", "Explorer", "F-150", "Ranger", "Fusion", "Escape", "Edge", "Expedition", "Bronco", "Maverick", "EcoSport", "GT"],
                  "Genesis": ["G70", "G80", "G90", "GV70", "GV80", "Essentia"],
                  "GMC": ["Acadia", "Terrain", "Yukon", "Sierra", "Canyon", "Savanna", "Syclone"],
                  "Honda": ["Civic", "Accord", "Fit", "CR-V", "Pilot", "Ridgeline", "HR-V", "Odyssey", "Passport", "Civic Type R", "NSX"],
                  "Hummer": ["H1", "H2", "H3", "EV"],
                  "Hyundai": ["Elantra", "Sonata", "Tucson", "Santa Fe", "Palisade", "Veloster", "Kona", "Ioniq", "Venue", "Veloster N"],
                  "Infiniti": ["Q50", "Q60", "Q70", "QX50", "QX60", "QX80", "Q30", "QX30", "Q60 Red Sport 400"],
                  "Isuzu": ["D-Max", "MU-X", "Trooper", "Rodeo"],
                  "Jaguar": ["XE", "XF", "XJ", "F-Pace", "E-Pace", "I-Pace", "F-Type", "XK"],
                  "Jeep": ["Wrangler", "Cherokee", "Grand Cherokee", "Compass", "Renegade", "Gladiator", "Patriot", "Commander", "Liberty", "Grand Cherokee SRT"],
                  "Kia": ["ELKOPTAN","Rio", "Optima", "Sportage", "Sorento", "Telluride", "Stinger", "Forte", "Soul", "Seltos", "K5", "Carnival", "Stinger GT"],
                  "Lamborghini": ["Huracan", "Aventador", "Urus", "Gallardo", "Murcielago", "Diablo", "Countach"],
                  "Lancia": ["Ypsilon", "Delta", "Thema", "Stratos"],
                  "Land Rover": ["Range Rover", "Range Rover Sport", "Discovery", "Defender", "Range Rover Velar", "Range Rover Evoque", "SVR"],
                  "Lexus": ["IS", "ES", "GS", "RX", "NX", "LX", "UX", "GX", "RC", "LS", "LFA"],
                  "Lincoln": ["MKC", "MKZ", "Navigator", "Corsair", "Aviator", "Continental", "MKX", "MKT"],
                  "Maserati": ["Ghibli", "Levante", "Quattroporte", "GranTurismo", "GranCabrio", "MC20"],
                  "Mazda": ["Mazda3", "Mazda6", "CX-3", "CX-5", "CX-9", "MX-5", "CX-30", "RX-7", "RX-8"],
                  "Mercedes": ["A-Class", "C-Class", "E-Class", "S-Class", "GLA", "GLE", "GLC", "CLS", "G-Class", "SL-Class", "GLS", "AMG GT", "AMG C63"],
                  "Mini": ["Cooper", "Countryman", "Clubman", "Paceman", "John Cooper Works"],
                  "Mitsubishi": ["Mirage", "Lancer", "Outlander", "Pajero", "Eclipse Cross", "ASX", "L200", "Lancer Evolution"],
                  "Nissan": ["Altima", "Sentra", "Maxima", "Rogue", "Murano", "Pathfinder", "370Z", "GT-R", "Juke", "Kicks", "Versa", "Nismo"],
                  "Peugeot": ["208", "308", "508", "2008", "3008", "5008", "207", "307", "407", "RCZ"],
                  "Porsche": ["911", "Cayenne", "Macan", "Panamera", "Taycan", "718 Boxster", "718 Cayman"],
                  "Renault": ["Clio", "Megane", "Kadjar", "Koleos", "Talisman", "Captur", "Duster", "Megane RS"],
                  "Rolls-Royce": ["Ghost", "Wraith", "Dawn", "Phantom", "Cullinan", "Silver Shadow", "Silver Spur"],
                  "Saab": ["9-3", "9-5", "9-4X", "900"],
                  "Scion": ["tC", "FR-S", "iQ", "xB", "xD"],
                  "Seat": ["Ibiza", "Leon", "Ateca", "Arona", "Tarraco", "Cupra"],
                  "Skoda": ["Octavia", "Superb", "Kodiaq", "Kamiq", "Karoq", "Scala", "RS"],
                  "Smart": ["Fortwo", "Forfour", "Roadster"],
                  "SsangYong": ["Tivoli", "Korando", "Rexton", "Musso", "Actyon"],
                  "Subaru": ["Impreza", "Legacy", "Outback", "Forester", "Crosstrek", "Ascent", "BRZ", "WRX", "STI"],
                  "Suzuki": ["Swift", "Vitara", "Jimny", "Celerio", "Baleno", "Ignis", "S-Cross", "Swift Sport"],
                  "Tata": ["Tiago", "Nexon", "Harrier", "Safari", "Hexa", "Altroz"],
                  "Tesla": ["Model S", "Model 3", "Model X", "Model Y", "Roadster", "Cybertruck"],
                  "Toyota": ["Corolla", "Camry", "Prius", "Yaris", "Highlander", "Land Cruiser", "Supra", "4Runner", "RAV4", "Tacoma", "Tundra", "C-HR", "86", "GR Yaris"],
                "Volkswagen": ["Golf", "Passat", "Jetta", "Tiguan", "Atlas", "Arteon", "Beetle", "Touareg", "Polo", "ID.4", "Golf GTI", "Golf R"],
                  "Volvo": ["S60", "S90", "V60", "XC40", "XC60", "XC90", "V90", "S40", "Polestar 1", "Polestar 2"
                           ]
 ]
    
    let years = (2020...2025).map { "\($0)" } // Years from 2020 to 2025
    
    let mileageOptions: [String] = [
        "0 - 500","500 - 1000", "1000 - 10000", "10000 - 30000", "30000 - 50000","50000 - 100000"
    ]
    
    var filteredYearsTo: [String] {
        if let yearFromInt = Int(yearFrom) {
            return years.filter { Int($0) ?? 0 >= yearFromInt }
        } else {
            return years
        }
    }
    
    var groupedCarMakes: [String: [String]] {
        Dictionary(grouping: carMakes, by: { String($0.prefix(1)) })
            .mapValues { $0.sorted() }
            .sorted(by: { $0.key < $1.key })
            .reduce(into: [:]) { result, entry in
                result[entry.key] = entry.value
            }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Car Make Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Marka")
                        .font(.headline)
                    Button(action: {
                        showCarMakePicker.toggle()
                    }) {
                        Text(carMake.isEmpty ? "select" : carMake)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                    }
                    .sheet(isPresented: $showCarMakePicker) {
                        NavigationView {
                            List {
                                ForEach(groupedCarMakes.keys.sorted(), id: \.self) { letter in
                                    Section(header: Text(letter).font(.headline)) {
                                        ForEach(groupedCarMakes[letter] ?? [], id: \.self) { make in
                                            Text(make)
                                                .onTapGesture {
                                                    carMake = make
                                                    carModel = "" // Clear car model when a new make is selected
                                                    showCarMakePicker.toggle() // Close the car make picker
                                                    showCarModelPicker.toggle() // Open the car model picker
                                                }
                                        }
                                    }
                                }
                            }
                            .navigationBarTitle("select brand", displayMode: .inline)
                            .navigationBarItems(leading: Button(action: {
                                showCarMakePicker.toggle()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                }
                
                // Car Model Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Model")
                        .font(.headline)
                    Button(action: {
                        showCarModelPicker.toggle()
                    }) {
                        Text(carModel.isEmpty ? "select" : carModel)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                    }
                    .sheet(isPresented: $showCarModelPicker) {
                        NavigationView {
                            List {
                                ForEach(carModels[carMake] ?? [], id: \.self) { model in
                                    Text(model)
                                        .onTapGesture {
                                            carModel = model
                                            showCarModelPicker.toggle()
                                        }
                                }
                            }
                            .navigationBarTitle("select model", displayMode: .inline)
                            .navigationBarItems(leading: Button(action: {
                                showCarModelPicker.toggle()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                }

                // Year From/To Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("سنة الصنع")
                        .font(.headline)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Picker("From", selection: $yearFrom) {
                                ForEach(years, id: \.self) { year in
                                    Text(year).tag(year)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Picker("To", selection: $yearTo) {
                                ForEach(filteredYearsTo, id: \.self) { year in
                                    Text(year).tag(year)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
                
                // Condition Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Condition")
                        .font(.headline)
                    Picker("Condition", selection: $condition) {
                        Text("New").tag("New")
                        Text("Used").tag("Used")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
                }
                
                // Mileage Selection (conditional)
                if condition == "Used" {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Distance")
                            .font(.headline)
                        Button(action: {
                            showMileagePicker.toggle()
                        }) {
                            Text(selectedMileage.isEmpty ? "Select KM" : selectedMileage)
                                .foregroundColor(.blue)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .strokeBorder(Color.gray, lineWidth: 1)
                                )
                        }
                        .sheet(isPresented: $showMileagePicker) {
                            NavigationView {
                                List {
                                    ForEach(mileageOptions, id: \.self) { option in
                                        Text(option)
                                            .onTapGesture {
                                                selectedMileage = option
                                                showMileagePicker.toggle()
                                            }
                                    }
                                }
                                .navigationBarTitle("Select Mileage", displayMode: .inline)
                                .navigationBarItems(leading: Button(action: {
                                    showMileagePicker.toggle()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.blue)
                                })
                            }
                        }
                    }
                }

                // Search Button
                NavigationLink(destination: SearchCarView(), isActive: $navigateToSearchCarView) {
                    Button(action: {
                        print("بحث عن نوع السيارة: \(carMake), موديل السيارة: \(carModel), سنة الصنع من: \(yearFrom) إلى: \(yearTo), المسافة من: \(distanceFrom) كم إلى: \(distanceTo) كم, الحالة: \(condition), المسافة المقطوعة: \(selectedMileage)")
                        navigateToSearchCarView = true
                    }) {
                        Text("Search")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.brown)
                            .cornerRadius(50)
                        
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            
            .padding()
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
