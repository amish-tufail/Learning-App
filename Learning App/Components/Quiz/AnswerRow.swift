//
//  AnswerRow.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State var isSelected = false
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var quizManager: ResultModel
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    var body: some View {
            HStack(spacing: 20) {
                Text(answer.text)
                if isSelected {
                    Spacer()
                    Image(systemName: answer.isCorrect ? "checkmark" : "xmark")
                        .foregroundColor(answer.isCorrect ? green : red)
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
                        .padding(9.0) // this padding and the below modifer gives a round outer to the image
                        .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .strokeStyle(cornerRadius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Stroke Style@*/Color(red: 0.37, green: 0.293, blue: 0.621)/*@END_MENU_TOKEN@*/)
                        )
                }
            }
            .padding()
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
            .background(colorScheme == .light ? LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing) : LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.14509804546833038, green: 0.12156862765550613, blue: 0.2549019753932953, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.14509804546833038, green: 0.12156862765550613, blue: 0.2549019753932953, alpha: 0)), location: 1)]),
                startPoint: UnitPoint(x: 1, y: 1),
                endPoint: UnitPoint(x: 1, y: 1)))
            .cornerRadius(18)
            .shadow(color: isSelected ? (answer.isCorrect ? green.opacity(0.5) : red.opacity(0.5)) : Color("Shadow").opacity(0.5), radius: 20, x: 0.5, y: 0.5)
            
            .onTapGesture {
                withAnimation {
                    if !quizManager.answerSelected {
                        isSelected = true
                        quizManager.selectAnswer(answer: answer)
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(isSelected ? (colorScheme == .dark ? (answer.isCorrect ? green : red) : .white) : (colorScheme == .light ? .white : /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Stroke Style@*/Color(red: 0.37, green: 0.293, blue: 0.621)/*@END_MENU_TOKEN@*/))
                
            )
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .preferredColorScheme(.light)
    }
}
