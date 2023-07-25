//
//  DatabaseManager.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/24/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DatabaseManager: ObservableObject {
    static let shared = DatabaseManager()
    let firestore = Firestore.firestore()
    
    
    func fetchPrograms() async -> [Program]? {
        guard let uid = Auth.auth().currentUser?.uid else { return nil}
        
        guard let snapshot = try? await Firestore.firestore().collection("programs").getDocuments() else { return nil}
        let programs: [Program] = snapshot.documents.map({ try! $0.data(as: Program.self) })
        
        debugPrint("Programs \(programs)")
        return programs
    }
    
    func createPrograms() async throws {
        do {
            let programs = Program.mockPrograms
            for program in programs {
                let encodedProgram = try Firestore.Encoder().encode(program)
                try await Firestore.firestore().collection("programs").document(program.id).setData(encodedProgram)
            }
            
        } catch {
            debugPrint("Failed to create program with error \(error.localizedDescription)")
        }
    }
}
