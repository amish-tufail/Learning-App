//
//  ModalView.swift
//  Learning App
//
//  Created by Amish Tufail on 23/04/2022.
//

import SwiftUI
import AudioToolbox

struct ModalView: View {
    let generator = UISelectionFeedbackGenerator()
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal = true
    @State var viewState: CGSize = .zero
    @State var isDismissed = false
    @State var appear = [false, false , false]
    @State var showStatusBar = false
    @AppStorage("showAlertView") var showAlertView: Bool = false
    @AppStorage("isLogged") var isLogged = false
    var body: some View {
        ZStack {
            Color.clear.background(.ultraThinMaterial) // To hide the background data
                .onTapGesture {
                    dismissModal()
                }
                .ignoresSafeArea()
            Group {
                switch model.selectedModal {
                case .signUp: SignUpView()
                case .signIn: SignInView()
                }
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: viewState.width, y: viewState.height)
            .offset(y: isDismissed ? 1000 : 0 )
            .rotationEffect(.degrees(viewState.width / 40)) // lets us move and right
            .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0))
            .hueRotation(.degrees(viewState.width / 5))
            .gesture(drag)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .opacity(appear[0] ? 1 : 0)
            .offset(y: appear[0] ? 0 : 200)
            .padding(20) // Outside Padding
            .background(
                Image("Blob 1")
                    .offset(x: 200, y: -100)
                    .opacity(appear[2] ? 1 : 0)
                    .offset(y: appear[2] ? 0 : 10)
                    .blur(radius: appear[2] ? 0 : 40)
                    .allowsHitTesting(false) // To avoid blob getting in the way of tap end background gesture
                    .accessibility(hidden: true)
            )
            Button {
                dismissModal()
                generator.selectionChanged()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .opacity(appear[1] ? 1 : 0)
            .offset(y: appear[1] ? 0 : -200)
            if showAlertView {
                Alert()
                    .zIndex(1)
            }
        }
        .onAppear {
            withAnimation(.easeOut) {
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.1)) {
                appear[1] = true
            }
            withAnimation(.easeOut(duration: 1 ).delay(0.2)) {
                appear[2] = true
            }
        }
        .onChange(of: isLogged) { newValue in
            if newValue {
                dismissModal()
            }
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded  { value in
                if value.translation.height > 200  {
                    dismissModal()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }
    func dismissModal() {
        withAnimation  {
            showModal = false
        }
        withAnimation(.linear.delay(0.3)) {
            isDismissed = true
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
