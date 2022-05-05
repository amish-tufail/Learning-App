//
//  Quiz.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

struct Result: Identifiable, Decodable {
    var id = UUID()
    var question: String
    var correct_answer: String
    var incorrect_answer: [String]
    
    
}

//var answers: Answer = [
//    Result(question: "What keyword is used to define a constant in Swift?", correct_answer: "var", incorrect_answer: ["const",
//                                                                                                                      "let",
//                                                                                                                      "const var"]),
//    Result(question: "How large is an Int?", correct_answer: "64 bits", incorrect_answer: ["16 bits",
//                                                                                           "32 bits",
//                                                                                           "It depends on the platform"]),
//    Result(question: "Structures can't:", correct_answer: "Conform to protocols to provide standard functionality of a certain kind", incorrect_answer: ["Define properties to store values",
//                                                                                                                                                         "Define initializers to set up their initial state",
//                                                                                                                                                         "Inherit the characteristics of another structure"]),
//    Result(question: "What is the type and value of str in the following expression?", correct_answer: "Type: String, Value: \"12.0\"", incorrect_answer: ["Type: String?, Value: \"12.0\"",
//                                                                                                                                                           "Type: String, Value: \"12\"",
//                                                                                                                                                           "Type: String?, Value: nil"]),
//    Result(question: "What operator takes two numbers, and returns a boolean?", correct_answer: "all of the above", incorrect_answer: [">",
//                                                                                                                                       "==",
//                                                                                                                                       "!=",
//                                                                                                                                      ]),
//    Result(question: "What does the following code output?", correct_answer: "3", incorrect_answer: ["0",
//                                                                                                     "6",
//                                                                                                     "10"]),
//    Result(question: "What is the following function's return type?", correct_answer: "Bool", incorrect_answer: ["String",
//                                                                                                                 "Int",
//                                                                                                                 "It doesn't have a return type"]),
//    Result(question: "Structures can't:", correct_answer: "Conform to protocols to provide standard functionality of a certain kind", incorrect_answer: [ "Define properties to store values",
//                                                                                                                                                          "Define initializers to set up their initial state",
//                                                                                                                                                          "Inherit the characteristics of another structure"]),
//    Result(question: "Why might you throw an error?", correct_answer: "The code has become too complicated to continue writing", incorrect_answer: [ "The code has become too easy",
//                                                                                                                                                     "Something unexpected happened and the normal flow of execution can't continue",
//                                                                                                                                                     "To pass data to a caller method"
//                                                                                                                                                   ]),
//    Result(question: "How can you deal with an error?", correct_answer: "By informing the user of the failure", incorrect_answer: ["By correcting the problem",
//                                                                                                                                   "By trying an alternative approach",
//                                                                                                                                   "All of the above"])
//]
