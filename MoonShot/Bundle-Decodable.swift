//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("\(file) could not be loaded!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
       guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return decodedData
    }

}

