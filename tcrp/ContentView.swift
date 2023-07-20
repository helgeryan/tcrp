//
//  ContentView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let cardWidth = (UIScreen.main.bounds.width / 2) - 60
        
        
        VStack(spacing: 20) {
            
            HStack {
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color(.gray))
                    .frame(width: 30, height: 30, alignment: .leading)
                
                Spacer()
            }
            .padding(.bottom, -40)
            
            Image("aaron")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .leading)
                .clipShape(Circle())
            
            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    Image(systemName: "phone")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .foregroundColor(.gray)
                    Text("Contact")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                .frame(width: cardWidth, height: cardWidth)
                .background(Color("lightBlue"))
                .cornerRadius(10)
                
                VStack(spacing: 20) {
                    Image(systemName: "list.bullet.clipboard.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                    Text("Programs")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                .frame(width: cardWidth, height: cardWidth)
                .background(Color("lightBlue"))
                .cornerRadius(10)
            }
            
            HStack {
                VStack(spacing: 20) {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                    Text("Book")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                .frame(width: cardWidth, height: cardWidth)
                .background(Color("lightBlue"))
                .cornerRadius(10)
                
            }
            
            Spacer()
        }
        .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
