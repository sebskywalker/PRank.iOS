//
//  CategoryHome.swift
//  PRank
//
//  Created by seb's on 11/16/24.
//

import SwiftUI

struct CategoryHome: View {
<<<<<<< HEAD
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
=======
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        NavigationView{
            
            List{
                
                modelData.featured[5].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys
                    .sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key,
                                    items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
            }
           
                .navigationTitle("Featured")
        }
>>>>>>> 7cda8a9 (new categorys)
    }
}

#Preview {
    CategoryHome()
<<<<<<< HEAD
=======
        .environmentObject(ModelData())
>>>>>>> 7cda8a9 (new categorys)
}
