//
//  InspirationView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/26/23.
//

import SwiftUI


struct InspirationView: View {
    let inspirationHeader: String
    let inspirationText: String
    let imageName: String
    let halfScreen = UIScreen.main.bounds.width / 2
    var body: some View {
        HStack (spacing: 0) {
            VStack(alignment: .leading) {
                Text(inspirationHeader)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                Text(inspirationText)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .frame(width: halfScreen)
            .background(Color.lightBlue)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: halfScreen)
        }
    }
}
