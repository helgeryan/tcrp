//
//  FooterView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/25/23.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        ZStack {
            Image("tcrpfull")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Rectangle()
                .background(.black)
                .opacity(0.7)
            VStack(alignment: .leading, spacing: 10) {
                Text("Twin Cities Rehab & Performance")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.lightBlue)
                
                Text("aaronkubalDC@gmail.com")
                    .foregroundColor(.white)
                    .tint(Color(.white))
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
