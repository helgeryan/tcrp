//
//  Quiz.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/31/23.
//

import Foundation

class Quiz: ObservableObject {
    let title: String
    let description: String
    @Published var questions: [Question]
    
    init(title: String, description: String, questions: [Question]) {
        self.title = title
        self.description = description
        self.questions = questions
    }
    
    func getScore() -> String {
        var numCorrect = 0
        for question in self.questions {
            if question.answer == question.correctAnswer {
                numCorrect = numCorrect + 1
            }
        }
        return "You got \(numCorrect)/\(self.questions.count) questions correct."
    }
    
    func updateQuestion(index: Int, answer: Int) {
        questions[index].answer = answer
    }
    
    func getMissingQuestions() -> [Int] {
        var missingQuestions: [Int] = []
        for (index, question) in questions.enumerated() {
            if question.answer < 0 {
                missingQuestions.append(index)
            }
        }
        return missingQuestions
    }
}

struct Question: Equatable, Codable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.question == rhs.question
    }
    
    let question: String
    var options: [QuestionOption]
    var answer: Int
    let correctAnswer: Int
}


struct QuestionOption: Codable {
    let index: Int
    let answer: String
}
