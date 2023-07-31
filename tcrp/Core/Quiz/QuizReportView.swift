//
//  QuizReportView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/31/23.
//

import SwiftUI

struct ReportView: View {
    @Binding var quizQuestion: Int
    var quiz: Quiz
    var body: some View {
        VStack {
            Text(quiz.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(quiz.description)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text(quiz.getScore())
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Button(action: {
                quizQuestion = -1
            }, label: {
                Text("Back to start")
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
