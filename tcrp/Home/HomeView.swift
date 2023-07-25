//
//  HomeView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var dbManager: DatabaseManager
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        let cardWidth = (UIScreen.main.bounds.width / 2) - 60
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    HStack {
                        Button {
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "text.justify")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color(.gray))
                                .frame(width: 25, height: 25, alignment: .leading)
                            
                        }
                        Spacer()
                    }
                    
                    Image("mobiusStrip")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150, alignment: .leading)
                        .clipShape(Circle())
                    
                    HStack(spacing: 20) {
                        TileView(presentSideMenu: .constant(false), tileWidth: cardWidth, iconName: "phone", title: "Contact")
                        TileView(presentSideMenu: .constant(false), tileWidth: cardWidth, iconName: "list.bullet.clipboard.fill", title: "Programs")
                    }
                    
                    
                    TileView(presentSideMenu: .constant(false), tileWidth: cardWidth, iconName: "book", title: "Book")
                    Spacer()
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
                )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false))
    }
}
