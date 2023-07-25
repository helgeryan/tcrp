//
//  ProgramsView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/21/23.
//

import SwiftUI

class ProgramsViewModel: ObservableObject {
    @Published var programs: [Program]?
    
    init() {
        Task {
            await fetchPrograms()
        }
    }
    func fetchPrograms() async {
        programs = await DatabaseManager.shared.fetchPrograms()
        debugPrint("Got this many programs: \(programs?.count ?? 0)")
    }
}


struct ProgramsView: View {
    
    @State var programsModel = ProgramsViewModel()
//    var programs: [Program] = [
//        Program(id: UUID().uuidString, name: "Back Pain", image: "figure.strengthtraining.functional", color: "AAAAAA", exercises: [
//            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
//            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
//        ]),
//        Program(id: UUID().uuidString, name: "Knee Pain", image: "figure.flexibility", color: "AAAAAA", exercises: [
//            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
//            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
//        ]),
//        Program(id: UUID().uuidString, name: "Dick Pain", image: "figure.jumprope", color: "AAAAAA", exercises: [
//            Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
//            Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
//        ])
//    ]
    
    var body: some View {
        List {
            if let programs = programsModel.programs {
                Section("Programs") {
                    ForEach(programs, id: \.name) { program in
                        NavigationLink {
                            ProgramView(program: program)
                        } label: {
                            Label(program.name, systemImage: program.image).foregroundColor(Color(hex: program.color))
                        }
                    }
                }
            }
        }
        .navigationTitle("Programs")
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgramsView()
        }
    }
}


struct Program: Hashable, Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let color: String
    let exercises: [Exercise]?
}


struct Exercise: Hashable, Identifiable, Codable  {
    var id: String
    let name: String
    let reps: Int
    let weight: Int
    let description: String
}

                extension Color {
                    init(hex: String) {
                        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
                        var int: UInt64 = 0
                        Scanner(string: hex).scanHexInt64(&int)
                        let a, r, g, b: UInt64
                        switch hex.count {
                        case 3: // RGB (12-bit)
                            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
                        case 6: // RGB (24-bit)
                            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
                        case 8: // ARGB (32-bit)
                            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
                        default:
                            (a, r, g, b) = (1, 1, 1, 0)
                        }
                        
                        self.init(
                            .sRGB,
                            red: Double(r) / 255,
                            green: Double(g) / 255,
                            blue:  Double(b) / 255,
                            opacity: Double(a) / 255
                        )
                    }
                }
