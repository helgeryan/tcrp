//
//  DarkContextView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/26/23.
//

import SwiftUI

struct DarkContextView: View {
    let imageName: String
    let header: String
    let context: String
    var body: some View {
        ZStack {
            Image("mobiusStrip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 150, alignment: .leading)
            
            Rectangle()
                .background(.black)
                .opacity(0.7)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding()
                HStack {
                    Text(header)
                        .background(.black)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(context)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}
