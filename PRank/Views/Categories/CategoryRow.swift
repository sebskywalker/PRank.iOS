//
//  CategoryRow.swift
//  PRank
//
//  Created by seb's on 11/16/24.
//

import SwiftUI

struct CategoryRow: View {
<<<<<<< HEAD
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CategoryRow()
}
=======
    
    var categoryName: String
    var items: [PRank]
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            
            ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { PRank in
                    NavigationLink {
                        PRankDetail(PRank: PRank)
                    } label: {
                        CategoryItem(PRank: PRank)
                        
                    }
                   
                }
            }
        }
        .frame(height: 180)
        
       }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var PRanks = ModelData().PRanks
    
    static var previews: some View {
        CategoryRow(categoryName: PRanks[0].category.rawValue,
                    items: Array(PRanks.prefix(3)))
    
        }
}
    
    
    
    
>>>>>>> 7cda8a9 (new categorys)
