//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by jinam on 4/22/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct  QuizBrain {
    var userScore:Float = 0.0
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    var questionNumber = 0
    
    mutating func    checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            userScore += 1
            return (true)
        } else {
            return (false)
        }
    }
    mutating func    nextQuestion() {
        if (questionNumber + 1 < quiz.count) {
            questionNumber += 1
        } else {
            questionNumber = 0
            userScore = 0
        }
    }
    func    getQuestionText() -> String{
        return (quiz[questionNumber].text)
    }
    func    getProgress() -> Float {
        return(Float(questionNumber + 1) / Float(quiz.count))
    }
    mutating func    getScore() -> Float {
        return (userScore)
    }
    func    getAnswers() -> [String] {
        return (quiz[questionNumber].answer)
    }
}
