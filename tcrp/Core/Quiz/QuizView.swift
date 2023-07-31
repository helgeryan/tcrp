//
//  QuizView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/31/23.
//

import SwiftUI

struct QuizView: View {
    @State var quizQuestion: Int = -1
    @StateObject var quiz: Quiz 
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                Spacer()
                if quizQuestion == -1 {
                    Text(quiz.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(quiz.description)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Button(action: {
                        quizQuestion = quizQuestion + 1
                    }, label: {
                        Text("Start Quiz")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding()
                    })
                    .background(Color.lightBlue)
                    .clipped()
                    .cornerRadius(10)
                } else if quizQuestion < quiz.questions.count {
                    QuestionView(quizQuestion: $quizQuestion, question: $quiz.questions[quizQuestion]).environmentObject(quiz)
                } else {
                    ReportView(quizQuestion: $quizQuestion, quiz: quiz)
                }
                Spacer()
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [.white, Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
        )
    }
}
