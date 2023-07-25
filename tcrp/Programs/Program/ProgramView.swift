//
//  ProgramView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/21/23.
//
import SwiftUI

struct ProgramView: View {
    let program: Program
    var body: some View {
        ZStack {
            Color(hex: program.color).ignoresSafeArea()
            VStack {
                List {
                    Section("Exercises") {
                        if let exercises = program.exercises {
                            ForEach(exercises, id: \.name) { exercise in
                                VStack(alignment: .leading) {
                                    NavigationLink {
                                        ExerciseView(exercise: exercise)
                                    } label: {
                                        Text(exercise.name)
                                    }
                                }
                            }
                        }
                    }
                }
                Image(systemName: program.image)
                Text(program.name)
            }
        }
        .navigationBarTitle(program.name, displayMode: .large)
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgramView(program: Program(id: UUID().uuidString, name: "Back Pain", image: "cpu", color: "00FF99", exercises: [
                Exercise(id: UUID().uuidString, name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
                Exercise(id: UUID().uuidString, name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
            ]))
        }
    }
}
