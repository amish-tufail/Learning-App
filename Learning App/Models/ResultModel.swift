//
//  ResultModel.swift
//  Learning App
//
//  Created by Amish Tufail on 05/05/2022.
//

import Foundation
import SwiftUI

class ResultModel: ObservableObject {
    @Published var quiz = [Result]()
    @Published var index: Int = 0
    @Published var length: Int = 10
    @Published var reachedEnd = false
    @Published var answerSelected = false
    @Published var question: AttributedString = ""
    @Published var answerChoices : [Answer] = []
    @Published var progress: CGFloat = 0.00
    @Published var score = 0
    init() {
        quiz = JSONParsing.fetchDetail()
    }
    
    func GoToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        if index < length {
            let currentQuestion = quiz[index]
                do {
                    let correct = [Answer(text: try AttributedString(markdown: currentQuestion.correct_answer), isCorrect: true)]
                    let incorrects = try currentQuestion.incorrect_answer.map { answer in
                        Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                    }
                    let allAnswers = correct + incorrects
                    answerChoices = allAnswers.shuffled()
                } catch {
                    print("Error setting answers: \(error)")
                    answerChoices = []
                }
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
