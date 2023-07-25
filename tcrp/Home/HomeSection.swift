//
//  HomeSection.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/25/23.
//

import SwiftUI

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


struct HomeSection_Previews: PreviewProvider {
    static var previews: some View {
        HomeInformationSectionView(imageName: "chairs", sections: [HomeSectionType.starterCall.section])
    }
}
