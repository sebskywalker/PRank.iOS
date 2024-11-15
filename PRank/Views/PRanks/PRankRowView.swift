//
//  PRankRow.swift
//  PRank
//
//  Created by seb's on 11/13/24.
//

import SwiftUI

struct PRankRowView: View {
    var PRank: PRank
    
    var body: some View {
        
        
        
        HStack {
            PRank.image.resizable()
                .frame(width: 50, height: 50)
            Text(PRank.name)
            
            Spacer()
            
            if PRank.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PRankRowView_Previews: PreviewProvider {
    static var PRanks = ModelData().PRanks
    static var previews: some View {
        
      //  Group {
            VStack {
                
                PRankRowView(PRank: PRanks[0])
                  //  .previewLayout(.fixed(width: 300, height: 70))
                
                PRankRowView(PRank: PRanks[1])
                   // .previewLayout(.fixed(width: 300, height: 70))
                
                PRankRowView(PRank: PRanks[2])
                   // .previewLayout(.fixed(width: 300, height: 70))
            }.previewLayout(.fixed(width: 300, height: 70))
        }
    }
//}
