//
//  LiteModeRow.swift
//  Learning App
//
//  Created by Amish Tufail on 11/05/2022.
//

import SwiftUI

struct LiteModeRow: View {
    @AppStorage("isLiteMode") var isLiteMode = false
    var body: some View {
        Toggle(isOn: $isLiteMode) {
            HStack(spacing: 12) {
                GradientIcon(icon: "speedometer")
                VStack(alignment: .leading) {
                    Text("Lite Mode")
                        .font(.subheadline, weight: .semibold)
                    Text("Better performance. Recommended for iPhone X and older.")
                        .font(.caption)
                        .opacity(0.2)
                }
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1))))
    }
}

struct LiteModeRow_Previews: PreviewProvider {
    static var previews: some View {
        LiteModeRow()
    }
}
