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
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgramsView()
        }
    }
}
