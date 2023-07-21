//
//  ProgramsView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/21/23.
//

import SwiftUI

struct ProgramsView: View {
    var programs: [Program] = [
        Program(name: "Back Pain", image: "figure.strengthtraining.functional", color: Color(.green)),
        Program(name: "Knee Pain", image: "figure.flexibility", color: Color(.blue)),
        Program(name: "Dick Pain", image: "figure.jumprope", color: Color(.red))
    ]
    
    var body: some View {
        List {
            Section("Programs") {
                ForEach(programs, id: \.name) { program in
                    NavigationLink {
                        ProgramView(program: program)
                    } label: {
                        Label(program.name, systemImage: program.image).foregroundColor(program.color)
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


struct Program: Hashable {
    let name: String
    let image: String
    let color: Color
}


