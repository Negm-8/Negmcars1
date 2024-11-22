//
//  FavoriteView.swift
//  Negm
//
//  Created by abdallah negm on 13/11/2024.
//

import SwiftUI

// صفحة المفضلة الجديدة
struct FavoriteView1: View {
    var body: some View {
        Text("FavoriteView1")
            .font(.largeTitle)
            .foregroundColor(.black)
            .navigationBarTitle("FavoriteView1", displayMode: .inline) // عنوان صفحة المفضلة
    }
}


// معاينة للعرض
struct FavoriteView1_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView1()
    }
}
