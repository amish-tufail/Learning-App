//
//  LaunchScreen.swift
//  Learning App
//
//  Created by Amish Tufail on 05/05/2022.
//

import SwiftUI

struct LaunchScreen: View {
    @State var isActive = false
    @State var size = 0.5
    @State var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("LaunchBackground").ignoresSafeArea()
                Image("LaunchLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut) {
                        self.isActive = true
                    } 
                }
            }

        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
