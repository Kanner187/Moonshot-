//
//  Mission.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Mission: Codable , Identifiable{
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    var displayName: String{
        "Apollo \(id)"
    }
    var image: String{
        "apollo\(id)"
    }
    
    var formattedDate: String {
        if let formattedDate = launchDate{
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: formattedDate)
        }else {
            return "N/A"
        }
    }
}

struct Crew: Codable {
    let name: String
    let role: String
}
