//
//  ContentView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var presentSideMenu: Bool = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        if viewModel.userSession != nil {
            ZStack {
                switch selectedSideMenuTab {
                case 0:
                    HomeView(presentSideMenu: $presentSideMenu)
                case 1:
                    ProgrammingView(presentSideMenu: $presentSideMenu)
                case 2:
                    ApproachView(presentSideMenu: $presentSideMenu)
                case 3:
                    AboutView(presentSideMenu: $presentSideMenu)
                case 4:
                    ProfileView(presentSideMenu: $presentSideMenu)
                case 5:
                    QuizListView(presentSideMenu: $presentSideMenu)
                default:
                    HomeView(presentSideMenu: $presentSideMenu)
                }
                
                
                SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
            }
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presentSideMenu: false, selectedSideMenuTab: 0)
    }
}
