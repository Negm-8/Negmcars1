//
//  ProfileView.swift
//  Negm
//
//  Created by abdallah negm on 06/08/2024

import SwiftUI

// Enum to manage profile options
enum ProfileViewModel: Int, CaseIterable {
    case Signin
    case Messages
    case Callus
    case Showroom
    case Jobs
    case Favorite
    case Us

    var title: String {
        switch self {
        case .Signin: return "Sign in"
        case .Messages: return "Write us a message"
        case .Callus: return "Call us"
        case .Showroom: return "حساب المعارض"
        case .Jobs: return "Jobs"
        case .Favorite: return "Favorite"
        case .Us: return "us"
        }
    }

    var imageName: String {
        switch self {
        case .Signin: return "person.fill"
        case .Messages: return "envelope.fill"
        case .Callus: return "phone.fill"
        case .Showroom: return "car.2.fill"
        case .Jobs: return "person.text.rectangle.fill"
        case .Favorite: return "heart.fill"
        case .Us: return "waveform.circle.fill"
        }
    }
}

// Profile Header View with no content
struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            // لا يوجد محتوى هنا، سيكون فارغًا تمامًا
            Spacer()
                .frame(height: 120) // يمكنك ضبط الارتفاع كما ترغب
        }
        .padding()
    }
}

// Profile menu options
struct SideMenuOptionView: View {
    let viewModel: ProfileViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 25)
                .foregroundColor(.white)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .contentShape(Rectangle()) // Makes the entire area tappable
    }
}

struct MoreView: View {
    @State private var isSignedIn = false
    @State private var showLoginView = false
    @State private var showCallAlert = false
    @State private var showCarShowroomAccount = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    ProfileHeaderView()
                        .frame(height: 120) // Maintain header height
                    
                    ForEach(ProfileViewModel.allCases, id: \.self) { option in
                        if option == .Favorite {
                            // Add NavigationLink for Favorite page here
                            NavigationLink(destination: Favourite1()) {
                                SideMenuOptionView(viewModel: option)
                            }
                            .padding(.vertical, 1)
                        } else {
                            Button(action: {
                                if option == .Signin && !isSignedIn {
                                    // Show the LoginView
                                    showLoginView = true
                                } else if option == .Messages {
                                    // Open email client with pre-filled information
                                    sendEmail()
                                } else if option == .Callus {
                                    // Show call alert
                                    showCallAlert = true
                                } else if option == .Showroom {
                                    // Navigate to CarShowroomAccount
                                    showCarShowroomAccount = true
                                }
                                print("\(option.title) button tapped")
                            }) {
                                SideMenuOptionView(viewModel: option)
                            }
                            .padding(.vertical, 1)
                            .background(
                                NavigationLink(destination: CarShowroomAccount(), isActive: $showCarShowroomAccount) {
                                    EmptyView()
                                }
                                .hidden()
                            )
                            .contentShape(Rectangle()) // Makes the entire area tappable
                        }
                    }

                    // NavigationLink for LoginView
                    NavigationLink(destination: LoginView(), isActive: $showLoginView) {
                        EmptyView()
                    }
                    .hidden()

                    Spacer()
                }
                .padding()
                .navigationBarHidden(true)
                .alert(isPresented: $showCallAlert) {
                    Alert(
                        title: Text("Call Customer Service"),
                        message: Text("Sunday to Thursday from 10 AM to 5 PM"),
                        primaryButton: .default(Text("Call: 01551552993")) {
                            makeCall(to: "01551552993")
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }
    }
}


// Function to open the default mail app
func sendEmail() {
    let email = "gomabdallah18@gmail.com"
    let subject = "Your Subject Here"
    let body = "Write your message here."
    let emailUrl = "mailto:\(email)?subject=\(subject)&body=\(body)"
    
    if let emailUrl = createEmailUrl(to: email, subject: subject, body: body) {
        if UIApplication.shared.canOpenURL(emailUrl) {
            UIApplication.shared.open(emailUrl)
        } else {
            print("Cannot open email application.")
        }
    }
}

func createEmailUrl(to: String, subject: String, body: String) -> URL? {
    let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    let urlString = "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)"
    return URL(string: urlString)
}

// Function to initiate a phone call
func makeCall(to number: String) {
    if let url = URL(string: "tel://\(number)") {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Cannot make a call.")
        }
    }
}

// Preview for Canvas
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
