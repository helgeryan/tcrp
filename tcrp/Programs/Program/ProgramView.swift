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
            program.color.ignoresSafeArea()
            VStack {
                List {
                    Section("Exercises") {
                        ForEach(program.exercises, id: \.name) { exercise in
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
            ProgramView(program: Program(name: "Back Pain", image: "cpu", color: .blue, exercises: [
                Exercise(name: "Back extensions", reps: 12, weight: 0, description: "Free weight back extensions"),
                Exercise(name: "Crunches", reps: 12, weight: 0, description: "Abdominal crunches to work the core")
            ]))
        }
    }
}
