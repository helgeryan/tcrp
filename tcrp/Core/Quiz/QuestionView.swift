//
//  QuestionView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/31/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quiz: Quiz
    @Binding var quizQuestion: Int
    @Binding var question: Question
    var body: some View {
        VStack {
            Text(question.question)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
            ForEach(question.options, id:\.answer, content: {
                option in
            
                HStack {
                    Button(action: {
                        quiz.updateQuestion(index: quizQuestion, answer: option.index)
                        debugPrint(self.question)
                    }, label: {
                        if option.index == question.answer {
                            Circle()
                                .foregroundColor(.lightBlue)
                                .frame(width: 20, height: 20)
                        } else {
                            Circle()
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .frame(width: 20, height: 20)
                        }
                    })
                    Text(option.answer)
                }
            })
            
            if quiz.questions.last != question {
                Button(action: {
                    quizQuestion = quizQuestion + 1
                }, label: {
                    Text("Next Question")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                })
                .padding()
                .background(Color.lightBlue)
                .clipped()
                .cornerRadius(10)
            } else {
                let missingQuestions = quiz.getMissingQuestions()
                if missingQuestions.count > 0 {
                    if  missingQuestions.count != 1 && (missingQuestions.last == quiz.questions.count - 1) {
                        Button(action: {
                            quizQuestion = missingQuestions.last!
                        }, label: {
                            Text("Unanswered questions, back to last unanswered question?")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                        })
                        .padding()
                        .background(Color.lightBlue)
                        .clipped()
                        .cornerRadius(10)
                    }
                }
                else {
                    Button(action: {
                        debugPrint(quiz)
                        quizQuestion = quizQuestion + 1
                    }, label: {
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    })
                    .padding()
                    .background(Color.lightBlue)
                    .clipped()
                    .cornerRadius(10)
                }
            }
            
            if quiz.questions.first != question {
                Button(action: {
                    quizQuestion = quizQuestion - 1
                }, label: {
                    Text("Previous Question")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                })
                .padding()
                .background(Color.lightBlue)
                .clipped()
                .cornerRadius(10)
            }
        }
    }
}
