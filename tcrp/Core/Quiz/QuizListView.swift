//
//  QuizListView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/31/23.
//

import SwiftUI

struct QuizListView: View {
    @Binding var presentSideMenu: Bool
    var quizzes: [Quiz] = [
        Quiz(title: "Ryan's Quiz", description: "This is a quiz to test", questions: [
            Question(question: "Question 1, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number 1."),
                QuestionOption(index: 1, answer: "Answer number 2."),
                QuestionOption(index: 2, answer: "Answer number 3."),
                QuestionOption(index: 3, answer: "Answer number 4.")
            ], answer: -1, correctAnswer: 0),
            
            Question(question: "Question 2, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number 1."),
                QuestionOption(index: 1, answer: "Answer number 2."),
                QuestionOption(index: 2, answer: "Answer number 3."),
                QuestionOption(index: 3, answer: "Answer number 4.")
            ], answer: -1, correctAnswer: 1),
            
            Question(question: "Question 3, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number 1."),
                QuestionOption(index: 1, answer: "Answer number 2."),
                QuestionOption(index: 2, answer: "Answer number 3."),
                QuestionOption(index: 3, answer: "Answer number 4.")
            ], answer: -1, correctAnswer: 2),
            
            
            Question(question: "Question 4, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number 1."),
                QuestionOption(index: 1, answer: "Answer number 2."),
                QuestionOption(index: 2, answer: "Answer number 3."),
                QuestionOption(index: 3, answer: "Answer number 4.")
            ], answer: -1, correctAnswer: 3)
        ]),
        Quiz(title: "Aaron's Quiz", description: "This is a quiz to test", questions: [
            Question(question: "Question A, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number A."),
                QuestionOption(index: 1, answer: "Answer number B."),
                QuestionOption(index: 2, answer: "Answer number C."),
                QuestionOption(index: 3, answer: "Answer number D.")
            ], answer: -1, correctAnswer: 0),
            
            Question(question: "Question 2, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number A."),
                QuestionOption(index: 1, answer: "Answer number B."),
                QuestionOption(index: 2, answer: "Answer number C."),
                QuestionOption(index: 3, answer: "Answer number D.")
            ], answer: -1, correctAnswer: 1),
            
            Question(question: "Question 3, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number A."),
                QuestionOption(index: 1, answer: "Answer number B."),
                QuestionOption(index: 2, answer: "Answer number C."),
                QuestionOption(index: 3, answer: "Answer number D.")
            ], answer: -1, correctAnswer: 2),
            
            
            Question(question: "Question 4, what is the number?", options: [
                QuestionOption(index: 0, answer: "Answer number A."),
                QuestionOption(index: 1, answer: "Answer number B."),
                QuestionOption(index: 2, answer: "Answer number C."),
                QuestionOption(index: 3, answer: "Answer number D.")
            ], answer: -1, correctAnswer: 3)
        ])
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(presentSideMenu: $presentSideMenu)
                List {
                    Section("Quizzes") {
                        ForEach(quizzes, id: \.title, content: { quiz in
                            NavigationLink(destination: {
                                QuizView(quiz: quiz)
                            }, label: {
                                Text(quiz.title)
                            })
                        })
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
}
struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView(presentSideMenu: .constant(false))
    }
}
