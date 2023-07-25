//
//  TileView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/21/23.
//

import SwiftUI

struct TileView: View {
    @Binding var presentSideMenu: Bool
    let tileWidth: CGFloat
    let iconName: String
    let title: String
    var body: some View {
        NavigationLink {
            ProgramsView(presentSideMenu: $presentSideMenu, showSideMenu: false)
        } label: {
            HStack {
                VStack(spacing: 20) {
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                    Text(title)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                .frame(width: tileWidth, height: tileWidth)
                .background(Color("lightBlue"))
                .cornerRadius(10)
                
            }
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(presentSideMenu: .constant(false), tileWidth: UIScreen.main.bounds.width / 2 - 60, iconName: "book", title: "Book")
    }
}
