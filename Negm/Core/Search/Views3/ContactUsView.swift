//
//  ContactUsView.swift
//  Negm
//
//  Created by abdallah negm on 29/09/2024.
//


import SwiftUI

struct ContactUsView: View {
    var body: some View {
        VStack {
            Text("Contact Us")
                .font(.largeTitle)
                .padding()

            Button(action: {
                sendEmail()
            }) {
                Text("Write us a message")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
    }

    // وظيفة لفتح تطبيق البريد باستخدام mailto
    func sendEmail() {
        let email = "gomabdallah18@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Email service is not available")
            }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
