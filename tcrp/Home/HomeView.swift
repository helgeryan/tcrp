//
//  HomeView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        let cardWidth = (UIScreen.main.bounds.width / 2) - 60
        NavigationStack {
        
            VStack(spacing: 20) {
                
                HStack {
                    Button {
                        viewModel.signOut()
                    } label: {
                        Image(systemName: "gear")
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
