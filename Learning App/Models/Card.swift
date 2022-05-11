//
//  Card.swift
//  Learning App
//
//  Created by Amish Tufail on 30/04/2022.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var time: String
    var button: String
}

var cards = [
    Card(title: "Learn \ndesign \nand code", text: "Learn by building real apps using Swift, React, Flutter and more. Design files and source code are included for each course.", time: "120 hours of video", button: "Get Started"),
    Card(title: "Gain \ncertificates \nand progress", text: "Take tests and receive a certificate after completion. You can track your progress for each course and pick up where you left.", time: "Test your skills", button: "Next"),
    Card(title: "Watch \non iPhone, iPad \nand web", text: "Watch anywhere and sync your progress across all platforms. Download videos for offline viewing.", time: "Learn anywhere", button: "Close")
]
