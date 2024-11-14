//
//  ModelData.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import Foundation


var PRanks: [PRank] = load("PRankData.jason")


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
        
    }
    
    do{
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
