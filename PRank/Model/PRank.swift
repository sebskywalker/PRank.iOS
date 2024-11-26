//
//  PRank.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct PRank: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var nickname: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category

    // Nuevos atributos
    var trainingSpot: String?
    var weightKg: Double
    var weightLbs: Double
    var heightFt: Double
    var currentAge: Int? // Solo para mujeres
    var primeAge: Int?   // Solo para hombres

    var prBenchPressKg: Double?
    var prBenchPressLbs: Double?
    var prBarbellSquatKg: Double?
    var prBarbellSquatLbs: Double?
    var prHipThrustKg: Double? // Solo para mujeres

    enum Category: String, CaseIterable, Codable {
        case legend = "Legend"
        case topglobal = "Top Global"
        case professional = "Professional"
        case elite = "Elite"
        case advanced = "Advanced"
        case intermediate = "Intermediate"
        case beginner = "Beginner"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
