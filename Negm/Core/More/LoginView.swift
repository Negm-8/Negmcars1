//
//  LoginView.swift
//  Negm
//
//  Created by abdallah negm on 27/09/2024.

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var phoneNumber: String = "" // لتخزين رقم الهاتف

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray // تغيير اللون هنا
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        // Dismiss the keyboard when tapping outside
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }

                VStack(spacing: 20) {
                    // جعل الصورة في أعلى الصفحة بحجم صغير
                    Image("negm22")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) // تعديل الحجم
                        .cornerRadius(50)

                    // إضافة العنوان
                    Text("ابدأ مع نجم")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)

                    // إضافة إدخال رقم الهاتف
                    phoneNumberSection

                    // محتوى تسجيل الدخول
                    VStack(spacing: 30) {
                        loginSection // أضف قسم تسجيل الدخول هنا
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }

    // قسم إدخال رقم الهاتف المحمول
    var phoneNumberSection: some View {
        VStack(spacing: 3) {
            // عنوان رقم الهاتف
            HStack {
                Spacer() // للتأكد من محاذاة العنوان إلى اليمين
                Text("رقم الهاتف المحمول")
                    .font(.headline)
                    .foregroundColor(.black)
            }

            // حقل إدخال رقم الهاتف
            TextField("أدخل رقم الهاتف", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .foregroundColor(.black) // تعيين لون الرقم الأسود
                .onReceive(phoneNumber.publisher.collect()) { input in
                    // تأكد من عدم تجاوز 11 رقمًا
                    let filtered = input.filter { "0123456789+20".contains($0) }
                    if filtered.count <= 11 {
                        phoneNumber = String(filtered) // تحويل المصفوفة إلى سلسلة نصية
                    } else {
                        phoneNumber = String(filtered.prefix(11)) // التأكد من عدم تجاوز 11 رقمًا
                    }
                }

            // عرض عدد الأرقام المتبقية
            Text("\(11 - phoneNumber.count) رقم متبقي")
                .foregroundColor(phoneNumber.count < 11 ? .gray : .red) // تغيير اللون حسب الحالة

            // زر تابع
            Button(action: {
                // تأكد أن الرقم يتبع تنسيق الأرقام المصرية
                if isValidEgyptianPhoneNumber(phoneNumber) {
                    print("Phone number is valid: \(phoneNumber)")
                    // تنفيذ الخطوات التالية لتسجيل الدخول
                } else {
                    print("Invalid Egyptian phone number.")
                }
            }) {
                Text("تابع")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
        }
        .padding(.horizontal, 30)
    }

    // قسم تسجيل الدخول
    var loginSection: some View {
        VStack(spacing: 20) {
            // إضافة فاصل بين "تابع" وباقي طرق التسجيل
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                Text("أو")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30) // إضافة حواف داخلية للمساحة حول الخطوط

            // زر تسجيل الدخول بواسطة Google
            Button(action: {
                signInWithGoogle()
            }) {
                HStack {
                    Image("google_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("تسجيل الدخول بواسطة Google")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }

            // زر تسجيل الدخول بواسطة Apple
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.email, .fullName]
                },
                onCompletion: { result in
                    handleAppleSignIn(result)
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

            // زر تسجيل الدخول بواسطة رقم الهاتف
            Button(action: {
                signInWithPhoneNumber()
            }) { }
        }
        .padding(.horizontal, 30)
    }

    // التحقق من صحة رقم الهاتف المصري
    func isValidEgyptianPhoneNumber(_ number: String) -> Bool {
        // التحقق من أن الرقم يبدأ بـ +20 أو 01 ويتبعه 9 أرقام
        let egyptPhoneRegex = "^(\\+20|01)[0-9]{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", egyptPhoneRegex)
        return phoneTest.evaluate(with: number)
    }

    // دوال التعامل مع تسجيل الدخول
    func signInWithGoogle() {
        print("Signing in with Google...")
    }

    func handleAppleSignIn(_ result: Result<ASAuthorization, Error>) {
        print("Signing in with Apple ID...")
    }

    func signInWithPhoneNumber() {
        print("Signing in with phone number...")
    }
}

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
