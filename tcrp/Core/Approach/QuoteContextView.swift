//
//  QuoteContextView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/26/23.
//

import SwiftUI


struct QuoteContextView: View {
    let quote: String
    let author: String
    var contextHeader: String? = nil
    let contextDescription: String
    var body: some View {
        VStack {
            HStack {
                Text("\"\(quote)\"")
                    .foregroundColor(.lightBlue)
                    .font(.system(size: 14))
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Spacer()
                Text("— \(author)")
                    .foregroundColor(.lightBlue)
                    .font(.system(size: 14))
                    .padding(.trailing, 20)
            }
            
            if let contextHeader = contextHeader {
                
                HStack {
                    Text(contextHeader)
                        .foregroundColor(.lightBlue)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                    Spacer()
                }.padding(.top, 20)
            }
            
            Text(contextDescription)
                .foregroundColor(.black)
                .font(.system(size: 12))
                .padding()
        }.padding(.top, 20)
    }
}
