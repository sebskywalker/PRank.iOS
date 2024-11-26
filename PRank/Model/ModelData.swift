//
//  ModelData.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    // Datos separados para hombres y mujeres
    @Published var womenPRanks: [PRank] = load("WomenPRankData.json")
    @Published var menPRanks: [PRank] = load("PRankData.json")
    
    // Orden deseado para las categorías
    let categoryOrder: [PRank.Category] = [
        .legend,       // Primero las Leyendas
        .topglobal,    // Luego los Top Globales
        .professional, // Profesionales
        .elite,        // Luego los Elite
        .advanced,     // Luego los Avanzados
        .intermediate, // Luego los Intermedios
        .beginner      // Por último los Principiantes
    ]
    
    // Categorías ordenadas para hombres
    var menCategories: [String: [PRank]] {
        orderCategories(data: menPRanks)
    }
    
    // Categorías ordenadas para mujeres
    var womenCategories: [String: [PRank]] {
        orderCategories(data: womenPRanks)
    }
    
    // Filtrar destacados (hombres y mujeres)
    var menFeatured: [PRank] {
        menPRanks.filter { $0.isFeatured }
    }
    
    var womenFeatured: [PRank] {
        womenPRanks.filter { $0.isFeatured }
    }
    
    // Función para ordenar las categorías
    private func orderCategories(data: [PRank]) -> [String: [PRank]] {
        let grouped = Dictionary(
            grouping: data,
            by: { $0.category.rawValue }
        )
        
        return grouped.sorted { lhs, rhs in
            guard
                let lhsIndex = categoryOrder.firstIndex(where: { $0.rawValue == lhs.key }),
                let rhsIndex = categoryOrder.firstIndex(where: { $0.rawValue == rhs.key })
            else {
                return false
            }
            return lhsIndex < rhsIndex
        }
        .reduce(into: [String: [PRank]]()) { result, pair in
            result[pair.key] = pair.value
        }
    }
}

// Función para cargar archivos JSON
func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't decode \(T.self): \(error)")
    }
}
