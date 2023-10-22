//
//  Astronaut.swift
//  Moonshot
//
//  Created by Paige Stephenson on 10/20/23.
//

import Foundation

//conform to Codable so we can create instances of this struct straight from JSON, but also Identifiable so we can use arrays of astronauts inside ForEach and more
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    
}
