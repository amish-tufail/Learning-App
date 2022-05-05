//
//  Alert.swift
//  Learning App
//
//  Created by Amish Tufail on 05/05/2022.
//

import SwiftUI
import AudioToolbox

struct Alert: View {
    let generator = UISelectionFeedbackGenerator()
    let vibration = UINotificationFeedbackGenerator() // For Alert Haptics
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("showAlertView") var showAlertView: Bool = false
    @AppStorage("alertTitle") var alertTitle: String = ""
    @AppStorage("alertMessage") var alertMessage: String = ""
    @State var appear = false
    var body: some View {
        ZStack {
            Color.clear.background(.ultraThinMaterial).ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.circle.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.systemBlue.opacity(0.7))
                
                Text(alertTitle)
                    .foregroundColor(.primary)
                    .font(.title2, weight: .bold)
                VStack(spacing: 30) {
                    Text("\(alertMessage)")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                    Button {
                        withAnimation {
                            showAlertView = false
                        }
                        generator.selectionChanged()
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .gradientForeground(colors: [.pink, .blue, .purple, .pink])
                    }
                    .font(.headline)
                    .buttonStyle(.angular)
                    .tint(.blue)
                    .controlSize(.large)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                }
            }
            .padding()
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .strokeStyle(cornerRadius: 30)
            .padding()
            .offset(y: 310)
            .opacity(appear ? 1 : 0)
            .offset(y: appear ? 0 : 560)
            .onAppear {
                withAnimation(.easeOut) {
                    appear = true
                }
                vibration.notificationOccurred(.error)
            }
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert()
            .preferredColorScheme(.dark)
    }
}
