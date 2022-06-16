//
//  Question.swift
//  Quizzler
//
//  Created by Mac on 16.06.2022.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let answer: String
    
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        choices = a
        answer = correctAnswer
    }
}
