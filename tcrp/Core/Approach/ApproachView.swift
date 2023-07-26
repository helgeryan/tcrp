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
                        
                        
                        QuoteContextView(quote: "Placebo treatments ought to be paid with a placebo payment.", author: "Dr. Harriet Hall", contextDescription: "We meet complex problems with straight-forward solutions. There are no gimmicks or cheap tricks in our approach. More often than not, the people we work with have already tried all of the flashy treatments. They are ready for something real.")
                        
                        QuoteContextView(quote: "Genius is making the complex simple.", author: "Albert Einstein", contextDescription: "The principles around our approach are simple. We identify what it is about your current situation that you would like to be different. We map out all of the stressors that contribute to your situation. We come up with a plan that allows you to adapt to the stressors that we can’t change, and modify the ones that we can. We put you in the driver’s seat while we guide by the side.")
                        
                        QuoteContextView(quote: "We must accept that patients are not neat packages of mechanics or pathology, but suffering human beings. Health care demands that we treat human beings.", author: "Prof. Gordon Waddell CBE, DSc, MD, FRCS", contextHeader: "Who Do We Help? People, Not Parts.", contextDescription: "Jerry, 59 years old, carpenter: loves golf but has given it up after decades of persistent pain.\n\nMichelle, 34 years old, new mother: overwhelmed balancing work & parenthood. Dealing with knee pain & doesn’t care for exercise.\n\nBobby, 22 years old, college student: elite level powerlifter who is scared to return to deadlifting because of a disc bulge.\n\nAnnie, 26 years old, runner: loves to run half-marathons but has removed them from her schedule for this year because of achilles pain that she can’t seem to get a grasp on.\n\nSusan, 48 years old: recently diagnosed with fibromyalgia and osteoarthritis after 6 years of chronic pain. No longer doing any of the things she loves and is concerned things will only get worse.")
                        
                        InspirationView(inspirationHeader: "Patient-Centered",inspirationText: "Everyone experiences pain & injury differently. We all have different goals, concerns, occupational/social circumstances, passions, and struggles. Knowing this, we don’t take a cookie-cutter approach in any aspect of patient care. Every case is a blank slate. We want to find what will work best for you, and we won’t know until we learn about you.", imageName: "pencils")
                        
                        InspirationView(inspirationHeader: "Shared Decision-Making",inspirationText: "There are always two experts in the room. You are the expert on your experience & how your pain/injury has impacted you. We need you involved in decision-making. This is more than just a doctor telling a patient what to do. It is two people putting their heads together to find the best way forward.", imageName: "handshake").padding(.top, 10)
                        
                        InspirationView(inspirationHeader: "Goal-Oriented",inspirationText: "If we do not set our intentions, any work we do will seem arbitrary. We work together with our clients to come up with realistic goals that make sense for them. Once we have done this, we identify all of the potential barriers that we might face along the way and plan accordingly. ", imageName: "reachsky").padding(.top, 10)
                        
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
