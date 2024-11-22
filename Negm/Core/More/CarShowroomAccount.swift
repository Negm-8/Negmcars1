//
//  CarShowroomAccount.swift
//  Negm
//
//  Created by abdallah negm on 17/10/2024.
//
import SwiftUI

struct CarShowroomAccount: View {
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer(minLength: 20) // مسافة أقل بين الجزء العلوي والصورة

                
//                مكان اللوجو فوق المربغ
//                HStack {
//                    Spacer(minLength: 220) // هذا سيؤدي إلى دفع اللوجو نحو اليمين
//                    Image("logo11")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100) // حجم الصورة
//                        .padding(.bottom, 1)
//                    Spacer() //  دفع اللوجو نحو اليسار
//                }
//                .padding(.horizontal)

                VStack(spacing: 30) { // محتوى المربع الأبيض
                    HStack(spacing: 10) { // العنوان مع الأيقونة بجانبه
                        Image(systemName: "door.garage.closed")
                            .resizable()
                            .frame(width: 30, height: 30) // حجم الأيقونة
                            .foregroundColor(.gray)
                        
                        Text("حسابات المعارض") // العنوان
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                    Text("إذا كنت صاحب معرض، يرجى تحميل تطبيق المعارض.") // النص
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Link(destination: URL(string: "https://apps.apple.com/app/idYOUR_APP_ID")!) {
                        Text("حمل التطبيق")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                            .background(Color.orange)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    
                    VStack(spacing: 5) {
                        Text("أو يمكنك استخدام")
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Link("المتصفح", destination: URL(string: "https://www.yourwebsite.com")!)
                            .underline()
                            .foregroundColor(.orange)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.4)
                .background(Color.white)
                .cornerRadius(40)
                .shadow(radius: 100) // إضافة ظل حول المربع
                
                Spacer(minLength: 250) // يمكنك تقليل هذه المسافة
            }
        }
    }
}

#Preview {
    CarShowroomAccount()
}

