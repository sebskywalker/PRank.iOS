//
//  CategoryRow.swift
//  PRank
//
//  Created by seb's on 11/16/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [PRank]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .foregroundColor(Color("Light")) // Letra blanca
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
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
        .background(Color("Background1")) // Fondo de la fila
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var PRanks = ModelData().PRanks

    static var previews: some View {
        CategoryRow(
            categoryName: PRanks[0].category.rawValue,
            items: Array(PRanks.prefix(3))
        )
        .environmentObject(ModelData())
        .previewLayout(.sizeThatFits) // Permite visualizarlo correctamente en el preview
        .background(Color("Background1")) // Muestra el fondo configurado
    }
}
