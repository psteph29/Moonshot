//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Paige Stephenson on 10/20/23.
//

import Foundation

//Next we want to convert astronauts.json into a dictionary of Astronaut instances, which means we need to use Bundle to find the path to the file, load that into an instance of Data, and pass it through a JSONDecoder. Previously we put this into a method on ContentView, but here I’d like to show you a better way: we’re going to write an extension on Bundle to do it all in one centralized place.


extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
////        Find the url for their file name in our installed app bundle. If it fails, call fatalError that says we couldn't locate it.
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
////        Load it into data
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//        let decoder = JSONDecoder()
////        Found the file, loaded data into a data instance, and now it can be decoded
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//        return loaded
////        loaded is the string astronaut dictionary
//    }
//    }

    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
        
    }
}
