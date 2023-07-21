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
        VStack {
            program.color.ignoresSafeArea()
            Image(systemName: program.image)
            Text(program.name)
            
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(program: Program(name: "Back Pain", image: "cpu", color: .blue))
    }
}
