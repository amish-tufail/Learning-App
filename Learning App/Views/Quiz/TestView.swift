//
//  TestView.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var quizManager: ResultModel
    var body: some View {
       QuestionView()
            .environmentObject(ResultModel())
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ResultModel())
    }
}
