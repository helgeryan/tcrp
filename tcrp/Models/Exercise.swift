//
//  Exercise.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/25/23.
//

import Foundation

struct Exercise: Hashable, Identifiable, Codable  {
    var id: String
    let name: String
    let reps: Int
    let weight: Int
    let description: String
}
