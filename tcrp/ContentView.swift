//
//  ContentView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.userSession != nil {
            HomeView(presentSideMenu: false)
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
