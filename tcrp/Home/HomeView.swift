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

struct HomeSection {
    let title: String
    let description: String
}

enum HomeSectionType {
    case rehabProgramming
    case telehealth
    case initialConsultation
    case starterCall
    
    var title: String {
        switch self {
        case .rehabProgramming:
            return "Rehab Programming"
        case .telehealth:
            return "Telehealth (Online Rehab)"
        case .initialConsultation:
            return "Initial Consultation"
        case .starterCall:
            return "Starter Call"
        }
    }
    
    var description: String {
        switch self {
        case .rehabProgramming:
            return "The future of pain rehabilitation is self-management. The focus is shifting from what a provider does TO you, to what they can do WITH you. Our variety of rehab programming options gives you the tools to take matters into your own hands, while we guide you through the process. You should come out the other end with a new skillset & the confidence to take care of yourself without relying on a clinician. See ‘Rehab Programming’ at the top of the page for more details."
        case .telehealth:
            return "Telehealth appointments give you the ability to get professional guidance and support for your pain without the hassle of fighting traffic, coming into the office, and trying to make your appointment on time.\n\nTwin Cities Rehab & Performance offers several virtual rehabilitation options for you to choose from so that you can find the one that best suits your needs.\n\nOur approach is rooted in education & exercise. There is nothing we do in-office that we cannot accomplish virtually."
        case .initialConsultation:
            return "We have an initial conversation of approximately 60-90 minutes to learn as much about you as we can. After you have told your story & been heard, we work together to come up with a plan, based on your goals, that works for you."
        case .starterCall:
            return "Not sure if we are the right fit for you? Want to learn more about our approach? Book a Starter Call. If you end up deciding to become a client, the $20 you paid for this call will be subtracted from the cost of your Initial Consultation."
        }
    }
    
    var section: HomeSection {
        return HomeSection(title: self.title, description: self.description)
    }
}


struct HomeInformationSectionView: View {
    let imageName: String
    let sections: [HomeSection]
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .padding(.bottom, 10)
            
            ForEach(sections, id: \.title) { section in
                HStack {
                    Text(section.title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.lightBlue)
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                HStack {
                    Text(section.description)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20.0)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}


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
