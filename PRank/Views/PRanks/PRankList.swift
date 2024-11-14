//
//  PRankList.swift
//  PRank
//
//  Created by seb's on 11/14/24.
//

import SwiftUI

struct PRankList: View {
    
    @EnvironmentObject var ModelData: ModelData
    
    @State private  var showFavoriteOnly = false
    var fileredPRanks: [PRank] {
        modelData.PRanks.filter{ PRank in
            (PRank.isFavorite || !showFavoriteOnly)
            
        }    }
    
    
    var body: some View {
        
        NavigationView{
            List {
                
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorite Only")
                }
              ForEach(fileredPRanks) { PRank in
                  
                  
                  
                  // List(PRanks){ PRank in
                  
                  
                  NavigationLink {
                      PRankDetail(PRank: PRank)
                  } label: {
                      PRankRowView(PRank: PRank)
                  }
              }
                
            }.navigationBarTitle("PRank")
        }
    }
}

    #Preview {
        PRankList()
             

    }

