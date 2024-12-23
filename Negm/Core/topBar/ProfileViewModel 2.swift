//
//  ProfileViewModel 2.swift
//  Negm
//
//  Created by abdallah negm on 08/10/2024.
//


import SwiftUI

// Enum to manage profile options
enum ProfileViewModel: Int, CaseIterable {
    case Signin
    case Messages
    case Callus
    case MySearch
    case Jobs
    case Logout

    var title: String {
        switch self {
        case .Signin: return "Sign in"
        case .Messages: return "Write us a message"
        case .Callus: return "Call us"
        case .MySearch: return "My Search"
        case .Jobs: return "Jobs"
        case .Logout: return "Logout"
        }
    }

    var imageName: String {
        switch self {
        case .Signin: return "person.fill"
        case .Messages: return "envelope.fill"
        case .Callus: return "phone.fill"
        case .MySearch: return "star.fill"
        case .Jobs: return "envelope.circle"
        case .Logout: return "arrow.left.square"
        }
    }
}

// Profile Header View with conditional rendering
struct ProfileHeaderView: View {
    let isSignedIn: Bool
    let userName: String
    let profileImageName: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if isSignedIn {
                    Image(profileImageName)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .padding(.bottom, 3)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text(userName)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Theme.textColor) // استخدام لون النص الموحد
                            .padding(.bottom, 2)
                    }
                }
                Spacer()
            }
            Spacer()
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
                .foregroundColor(Theme.textColor) // استخدام لون النص الموحد
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Theme.textColor) // استخدام لون النص الموحد
            
            Spacer()
        }
        .padding()
        .background(Theme.sideMenuOptionColor) // استخدام لون الخلفية الموحد
        .cornerRadius(8)
        .contentShape(Rectangle()) // Makes the entire area tappable
    }
}

// Main Profile View with conditional rendering and professional UI
struct ProfileView: View {
    @State private var isSignedIn = false
    let userName = "Abdallah Negm"
    let profileImageName = "negm22"
    @State private var showLoginView = false
    @State private var showCallAlert = false // State variable for showing call alert
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Theme.backgroundColor, Color.gray]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    // Conditional header based on sign-in status
                    ProfileHeaderView(isSignedIn: isSignedIn, userName: userName, profileImageName: profileImageName)
                        .frame(height: 120)
                    
                    ForEach(ProfileViewModel.allCases, id: \.self) { option in
                        Button(action: {
                            if option == .Signin && !isSignedIn {
                                // Show the LoginView
                                showLoginView = true
                            } else if option == .Logout && isSignedIn {
                                // Simulate log-out process
                                isSignedIn.toggle()
                            } else if option == .Messages {
                                // Open email client with pre-filled information
                                sendEmail()
                            } else if option == .Callus {
                                // Show call alert
                                showCallAlert = true
                            }
                            print("\(option.title) button tapped")
                        }) {
                            SideMenuOptionView(viewModel: option)
                        }
                        .padding(.vertical, 1)
                        .background(
                            NavigationLink(destination: LoginView(), isActive: $showLoginView) {
                                EmptyView()
                            }
                                .hidden()
                        )
                        .contentShape(Rectangle()) // Makes the entire area tappable
                    }
                    
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
            ProfileView()
        }
    }
}
