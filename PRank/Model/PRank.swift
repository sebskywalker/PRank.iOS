//
//  PRank.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct PRank: Codable, Hashable {
    var id: Int
    var name: String
    var nickname: String
    var state: String
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
        
}
    
