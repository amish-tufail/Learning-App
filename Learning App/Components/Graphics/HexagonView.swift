//
//  HexagonView.swift
//  Learning App
//
//  Created by Amish Tufail on 27/03/2022.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            // Text
            context.draw(Text("Learning App"), at: CGPoint(x: 55, y: 20))
            
            //Vector
            context.fill(Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)), with: .color(.pink))
            //SVG
            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            //SF Symbol
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(LinearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
