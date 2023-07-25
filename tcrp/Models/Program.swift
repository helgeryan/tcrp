//
//  Program.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/25/23.
//

import Foundation

struct Program: Hashable, Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let color: String
    let exercises: [Exercise]?
}

extension Program {
    static let mockPrograms: [Program] = [
        Program(id: UUID().uuidString, name: "Back Pain", image: "figure.strengthtraining.functional", color: "AAAAAA", exercises: [
            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
        ]),
        Program(id: UUID().uuidString, name: "Knee Pain", image: "figure.flexibility", color: "AAAAAA", exercises: [
            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
        ]),
        Program(id: UUID().uuidString, name: "Dick Pain", image: "figure.jumprope", color: "AAAAAA", exercises: [
            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
        ])
    ]
}
