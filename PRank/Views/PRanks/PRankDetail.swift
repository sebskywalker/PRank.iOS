//
//  PRankDetail.swift
//  PRank
//
//  Created by seb's on 11/14/24.
//

import SwiftUI

struct PRankDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var PRank: PRank
    
    var PRankIndex: Int {
        modelData.PRanks.firstIndex(where: { $0.id == PRank.id})!
    }
    

    var body: some View {
        ScrollView {
            // Mapa con la altura original
            MapView(coordinate: PRank.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300) // Altura original del mapa

            // Imagen en círculo más grande
            CircleImage(image: PRank.image)
                .frame(width: 250, height: 250) // Tamaño más grande para el círculo
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -125) // Ajuste de la posición vertical
                .padding(.bottom, -125) // Ajuste del espaciado debajo de la imagen

            // Contenido debajo de la imagen
            VStack(alignment: .leading) {
                
                HStack {
                    
                
                
                Text(PRank.name)
                    .font(.title)
                    
                    FavoriteButton(isSet: $modelData.PRanks [PRankIndex].isFavorite)
            }
                
                HStack {
                    Text(PRank.nickname)
                    Spacer()
                    Text(PRank.state)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Divider()
                
                Text("About \(PRank.name)")
                    .font(.title2)
                Text(PRank.description)
            }
            .padding()
            
            Spacer()
               
        } .ignoresSafeArea()
          .navigationTitle(PRank.name)
          .navigationBarTitleDisplayMode(.inline)
    }
}



struct PRankDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        
        PRankDetail(PRank: ModelData().PRanks[0])
            .environmentObject(modelData)
    }
}



