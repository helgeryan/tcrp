//
//  HomeView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var presentSideMenu: Bool
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        let cardWidth = (UIScreen.main.bounds.width / 2) - 60
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    
                    HStack {
                        Button {
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "staroflife.fill")
                                .resizable()
                                .foregroundColor(Color(.gray))
                                .frame(width: 30, height: 30, alignment: .leading)
                            
                        }
                        Spacer()
                    }
                    .padding(.bottom, -40)
                    
                    Image("mobiusStrip")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150, alignment: .leading)
                        .clipShape(Circle())
                    
                    HStack(spacing: 20) {
                        TileView(tileWidth: cardWidth, iconName: "phone", title: "Contact")
                        TileView(tileWidth: cardWidth, iconName: "list.bullet.clipboard.fill", title: "Programs")
                    }
                    
                    
                    TileView(tileWidth: cardWidth, iconName: "book", title: "Book")
                    Spacer()
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
                )
                
                SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: false)
    }
}
