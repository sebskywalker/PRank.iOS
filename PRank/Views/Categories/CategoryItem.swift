//
//  CategoryItem.swift
//  PRank
//
//  Created by seb's on 11/16/24.
//

import SwiftUI

struct CategoryItem: View {
<<<<<<< HEAD
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
=======
    
    var PRank: PRank
    
    var body: some View {
      
        
        VStack (alignment: .leading) {
            PRank.image
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(PRank.name)
                .font(.caption)
                .foregroundColor(.primary)
                
        }
        
        .padding(.leading, 15)
>>>>>>> 7cda8a9 (new categorys)
    }
}

#Preview {
<<<<<<< HEAD
    CategoryItem()
=======
    CategoryItem(PRank: ModelData().PRanks[0])
>>>>>>> 7cda8a9 (new categorys)
}
