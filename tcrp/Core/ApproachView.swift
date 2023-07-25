//
//  ApproachView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/25/23.
//

import SwiftUI

struct ApproachView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
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
                        }.padding()
                        
                        ZStack {
                            Image("chameleon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
                            Rectangle()
                                .aspectRatio(contentMode: .fit)
                                .background(.black)
                                .opacity(0.55)
                            
                            VStack(spacing: 20) {
                                HStack {
                                    Text("CLINICAL CHAMELEON:")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.lightBlue)
                                    Spacer()
                                }
                                HStack {
                                    Text("I am whoever the patient needs me to be, whenever they need me to be.")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.lightBlue)
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("For some it’s a voice of reassurance & reason. For others it’s a listening ear & an open mind.  Sometimes it’s a coach, sometimes a teacher. ")
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Spacer()
                                    Text("Whatever the case may be...")
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("we adapt to you.")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }.padding()
                        }
                        
                        ZStack {
                            Image("mobiusStrip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 150, alignment: .leading)
                            
                            Rectangle()
                                .background(.black)
                                .opacity(0.7)
                            
                            VStack {
                                Image("aarondesk")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 250)
                                    .padding()
                                HStack {
                                    Text("\"First, seek to underestand...\"")
                                        .background(.black)
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("You can’t be helped until you’ve been heard. The way forward starts with telling me your story. \n\nFrom the beginning, we work together to map out all of the things that might be contributing to your pain/injury experience. Through shared decision-making, we decide which factors we can have the greatest impact on and create a plan that gives you the ability to work toward your goals on your own terms, whatever they may be.")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
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

struct ApproachView_Previews: PreviewProvider {
    static var previews: some View {
        ApproachView(presentSideMenu: .constant(false))
    }
}
