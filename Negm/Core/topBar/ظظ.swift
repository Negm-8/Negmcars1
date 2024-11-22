//
//  ProfileViewModel 2.swift
//  Negm
//
//  Created by abdallah negm on 28/09/2024.
//


import SwiftUI

// Enum to manage profile options
enum ProfileViewModel: Int, CaseIterable {
    case Signin
    case Messages
    case Notification
    case Callus
    case Jobs
    case Logout

    var title: String {
        switch self {
        case .Signin: return "Sign in"
        case .Messages: return "Messages"
        case .Notification: return "Notification"
        case .Callus: return "Call us"
        case .Jobs: return "Jobs"
        case .Logout: return "Logout"
        }
    }

    var imageName: String {
        switch self {
        case .Signin: return "person.fill"
        case .Messages: return "bubble.left"
        case .Notification: return "bell"
        case .Callus: return "phone.fill"
        case .Jobs: return "envelope.circle"
        case .Logout: return "arrow.left.square"
        }
    }
}

// Profile Header View
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
                            .foregroundColor(.white)
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
                .foregroundColor(.white)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// Main Profile View with conditional rendering and professional UI
struct ProfileView: View {
    @State private var isSignedIn = false // Simulate sign-in state
    let userName = "Abdallah Negm"
    let profileImageName = "negm22" // Replace with the actual profile image

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack {
                    // Conditional header based on sign-in status
                    ProfileHeaderView(isSignedIn: isSignedIn, userName: userName, profileImageName: profileImageName)
                        .frame(height: 120)

                    ForEach(ProfileViewModel.allCases, id: \.self) { option in
                        if option == .Signin && !isSignedIn {
                            // استخدام NavigationLink لزر "Sign in"
                            NavigationLink(destination: LoginView()) {
                                SideMenuOptionView(viewModel: option)
                            }
                        } else {
                            // باقي الأزرار العادية
                            Button(action: {
                                if option == .Logout && isSignedIn {
                                    // Simulate log-out process
                                    isSignedIn.toggle()
                                }
                                print("\(option.title) button tapped")
                            }) {
                                SideMenuOptionView(viewModel: option)
                            }
                        }
                        .padding(.vertical, 1)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarHidden(true)
            }
        }
    }
}

// Preview for Canvas
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
