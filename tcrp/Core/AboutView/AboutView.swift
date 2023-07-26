//
//  AboutView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/26/23.
//

import SwiftUI

struct AboutView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        HeaderView(presentSideMenu: $presentSideMenu)
                    
                        Image("aaron")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .clipped()
                            .padding(.top, 20)
                        
                        VStack(alignment: .leading) {
                            Text("About Me")
                                .font(.system(size: 16))
                                .foregroundColor(.lightBlue)
                                .fontWeight(.bold)
                                .padding()
                            Text("Aaron Kubal is a board-certified chiropractor with special interests in rehabilitation and chronic pain. Utilizing education & exercise, Aaron delivers patient-centered care that is unique to each individual he works with, all under the umbrella of evidence-based practice. He prioritizes self-management & patient empowerment so that he can serve as a guide while patients work toward their goals. It is about working with you, not on you.\n\nAaron has been an advocate for evidence-based practice since long before completing his Doctorate of Chiropractic degree at Northwestern Health Sciences University. As a student, Aaron collaborated with Dr. Craig Liebenson and his group First Principles of Movement to put on over a dozen webinars designed to educate clinicians in providing high-value care via Telehealth. These webinars featured some of the greatest leaders in physical medicine, including legendary pain neuroscience researcher Pr. Lorimer Moseley PhD, and Jan Hartvigsen PhD, whom is currently one of the top musculoskeletal researchers in the world.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        VStack(alignment: .center) {
                            Text("The Möbius Strip")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding()
                            Text("I chose the möbius strip to represent my rehabilitation practice because it embodies the idea of a continuum. Pain is much more than just an unpleasant feeling in our body. It has the ability to touch so many other aspects of our lives. It impacts our work & home life, mental health, relationships, feelings about the future, valued life activities, social interactions, beliefs, sense of self…. the list goes on & on.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                                .multilineTextAlignment(.center)
                            Text("The experience of pain is a continuum. As such, rehabilitation needs to reflect this. We make a point to be aware of and address all burdensome aspects of the pain experience.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("We don’t treat painful necks, backs and elbows. We treat people in pain. To do that well, we look at the entire continuum.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                        }
                        
                        FooterView()
                    }
                }
            }.background(
                LinearGradient(gradient: Gradient(colors: [.white, Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(presentSideMenu: .constant(false))
    }
}
