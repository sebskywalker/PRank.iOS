//
//  ModelData.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var PRanks: [PRank] = load("PRankData.json")
    
    // Definimos el orden deseado para las categorías
    private let categoryOrder: [PRank.Category] = [
        .legend,       // Primero las Leyendas
        .topglobal,    // Luego los Top Globales
        .professional,
        .elite,        // Luego los Elite
        .advanced,     // Luego los Avanzados
        .intermediate, // Luego los Intermedios
        .beginner      // Por último los Principiantes
    ]
    
    // Agrupamos y ordenamos las categorías
    var categories: [String: [PRank]] {
        let grouped = Dictionary(
            grouping: PRanks,
            by: { $0.category.rawValue }
        )
        
        // Ordenamos las categorías de acuerdo al orden deseado
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
    
    // Filtrar los destacados
    var featured: [PRank] {
        PRanks.filter { $0.isFeatured }
    }
}

// Función para cargar el archivo JSON
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
