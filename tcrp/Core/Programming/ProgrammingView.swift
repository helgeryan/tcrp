//
//  ProgrammingView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/26/23.
//

import SwiftUI

struct ProgrammingView: View {
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
                            Image("mobiusStrip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 150, alignment: .leading)
                            
                            Rectangle()
                                .background(.black)
                                .opacity(0.7)
                            
                            VStack {
                                Image("bridge")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 250)
                                    .padding()
                                HStack {
                                    Text("Bridging The Gap...")
                                        .background(.black)
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("Our primary means of care is creating a program designed to take you from where you are to where you want to be. Learning as much about you as we can during our initial conversation makes this possible.\n\nThe things that make you & your experience unique are what give the program its shape. We factor in what provokes your symptoms, what you are apprehensive of or concerned about being able to do, what you want to be able to do, what activities/exercises you value most, what you do for work, and much more.\n\nWe aren't making a program for a painful body part; we are making a program for a person dealing with pain. The wide variety of factors we consider is a reflection of this.\n\nJust as symptoms and circumstances change, so does your programming. The value in our approach comes from the process, and part of the process is adapting to the situation as it unfolds. Everyone is different, and we cannot predict how you or your symptoms will respond to our plan. To reconcile this, we maintain an open line of communication and stand ready to make changes as we go.")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
                        }
                        
                        Text("Self-Management Programming: Main Features")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.lightBlue)
                            .padding().multilineTextAlignment(.center)
                        
                        let halfScreen = UIScreen.main.bounds.width / 2
                        HStack (spacing: 0) {
                            VStack(alignment: .leading) {
                                Text("The Recap")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .padding()
                                Text("Every program begins with a recap. This is an opportunity for you to see in writing how your provider is looking at the situation. This also gives you the opportunity to correct your provider on any misunderstandings you see, or fill in any blanks we might have overlooked.")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                    .padding()
                                Spacer()
                            }
                            .frame(width: halfScreen)
                            .background(Color.clear)
                            
                            Image("recap")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: halfScreen)
                                .clipped()
                        }
                        
                        
                        Image("recap2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 150)
                            .clipped()
                            .padding(.top, 20)
                        
                        VStack(alignment: .leading) {
                            Text("The Programming")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding()
                            Text("Typically, our exercise programming is laid out in a pattern of progressions and regressions. Good rehab prescription is always scalable. You should be able to see a clear path of progressions that bring you to your desired goal when you look at your programming. Conversely, a backup plan (regressions) should always be available to you for the days when you’re not feeling your best. This way, we can continue to tolerably progress you toward your goal without putting you on the shelf every time your sensitivity flares up. This allows us to develop consistency & avoid boom-or-bust type patterns.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        VStack(alignment: .center) {
                            Text("Programming Rate: Flexible & Affordable")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding()
                            Text("We have a set rate for care options, but there are levels of flexibility and payment plans that can be set up on a case-by-case basis. Talk with your provider about what options are available to make this a feasible option for you.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                                .multilineTextAlignment(.center)
                            Text("Self-Management Programming: you & your provider come up with a plan and let you run with it, making updates as you go based on your progress & input. The program is laid out to carry you several months into the future until you have reached your desired level of improvement or feel that you are ready for something more challenging. Your provider is available to you via email for any questions that may arise, and a follow-up consultation is included with your program that is pre-booked 4-6 weeks from the onset of the program to assess progress. Additional follow-up consultations can be purchased ‘a la carte’ as needed.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("- $400 (includes an individualized self-management program, a pre-booked follow-up consultation, video demonstrations as needed & unlimited, open-ended email support)")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("Programming Re-Up: in the event that you want to shift your focus to a new goal, you want to work on a new issue, or you simply want to overhaul your program & take a different approach, you can request a “Re-Up” of your programming at a reduced cost. This does NOT include a follow-up consultation. They can be booked ‘a la carte’ as needed.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("- $150 (includes an individualized self-management program, video demonstrations as needed & unlimited, open-ended email support)")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("Follow-Up Consultation (a la carte): if you have a question that is too complex for an email, want to troubleshoot an issue, discuss potential changes to your programming or simply check-in with your provider, follow-up consultations can be booked ‘a la carte.’")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                            
                            Text("- $45/15 minutes (same as consultation rate)")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
        
                            Spacer()
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

struct ProgrammingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingView(presentSideMenu: .constant(false))
    }
}
