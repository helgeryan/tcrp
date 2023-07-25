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

struct NewHomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var dbManager: DatabaseManager
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        let cardWidth = (UIScreen.main.bounds.width / 2) - 60
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
                            Image("mobiusStrip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 150, alignment: .leading)
                                .opacity(0.1)
                            
                            VStack(spacing: 20) {
                                HStack {
                                    Text("IF YOU WERE OUT OF PAIN TOMORROW, WHAT WOULD THAT LOOK LIKE FOR YOU?")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("LET’S FIND A WAY TO GET THERE, TOGETHER.")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hex: "008BFF"))
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
                        
                        VStack {
                            Text("Services")
                                .foregroundColor(Color(hex: "0088FF"))
                                .padding()
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                            
                            HomeInformationSectionView(imageName: "computerDesk", sections: [HomeSectionType.telehealth.section])
                            HomeInformationSectionView(imageName: "chairs", sections: [
                                HomeSectionType.initialConsultation.section,
                                HomeSectionType.starterCall.section
                            ])
                            HomeInformationSectionView(imageName: "dumbbells", sections: [HomeSectionType.rehabProgramming.section])
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
