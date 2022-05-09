//
//  QuestionView.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI
import AudioToolbox

struct QuestionView: View {
    var course: Course = courses[0]
    let generator = UISelectionFeedbackGenerator()
    @EnvironmentObject var quizManager: ResultModel
    @Environment(\.dismiss) var dismiss
    @State var showFinish = false
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                VStack(spacing: 10) {
                    HStack{
                        Button {
                            dismiss()
                            generator.selectionChanged()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .frame(width: 26.0, height: 26.0)
                                .cornerRadius(10.0)
                                .padding(9.0)                                .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                        }
                        Spacer()
                        Image(course.logo)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26.0, height: 26.0)
                            .cornerRadius(30)
                            .padding(9.0)
                            .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                    }
                    .padding()
                    VStack(alignment: .leading) {
                        Text(course.title.uppercased())
                            .foregroundColor(.white.opacity(0.8))
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Structures can't:")
                            .font(.title, weight: .heavy)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                        Text("Question \(quizManager.index + 1) out of \(quizManager.length)".uppercased())
                            .foregroundColor(.white.opacity(0.8))
                            .fontWeight(.semibold)
                        ProgressBar(progress: 175)
                            .offset(y: 25)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 50)
                    .padding()
                }
                .frame(height: 310)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.068, green: 0.27, blue: 0.626)/*@END_MENU_TOKEN@*/)
                .mask(
                    {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    }
                )
                .offset(y: -80)
                Spacer()
            }
            VStack(spacing: 30) {
//                Spacer()
//                Spacer()
                AnswerRow(answer: Answer(text: "Define properties to store values", isCorrect: false))
                AnswerRow(answer:  Answer(text: "Define initializers to set up their initial state", isCorrect: false))
                AnswerRow(answer: Answer(text: "Conform to protocols to provide standard functionality of a certain kind", isCorrect: true))
                AnswerRow(answer: Answer(text: "Inherit the characteristics of another structure", isCorrect: false))
                Divider()
                Button {
                    withAnimation {
                        showFinish = true
                        generator.selectionChanged()
                    }
                } label: {
                    PrimaryButton(text: "Next".uppercased())
                }
            }
            .padding()
            .offset(y: 90)
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showFinish) {
            FinishView()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .preferredColorScheme(.light)
            .environmentObject(Model())
            .environmentObject(ResultModel())
    }
}
