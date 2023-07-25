//
//  ProgramsView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/21/23.
//

import SwiftUI

@MainActor
class ProgramsViewModel: ObservableObject {
    @Published var programs: [Program]?
    
    init() {
//        Task {
//            await fetchPrograms()
//        }
    }
    func fetchPrograms() async {
        programs = await DatabaseManager.shared.fetchPrograms()
        debugPrint("Got this many programs: \(programs?.count ?? 0)")
    }
}


struct ProgramsView: View {
    @StateObject var programsModel = ProgramsViewModel()
    @Binding var presentSideMenu: Bool
    var showSideMenu: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                return self.getView(showSideMenuButton: showSideMenu)
            }
        }
    }
    
    @ViewBuilder func getView(showSideMenuButton: Bool) -> some View {
        if showSideMenuButton {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "text.justify")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(.gray))
                        .frame(width: 25, height: 25, alignment: .leading)

                }.padding()
                Spacer()
            }
        }
    
        Text("Programs")
            .font(.system(size: 24))
            .fontWeight(.bold)
        
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
        .onAppear {
            Task {
                await programsModel.fetchPrograms()
            }
        }
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgramsView(presentSideMenu: .constant(false))
        }
    }
}
