//
//  TabBar.swift
//  Learning App
//
//  Created by Amish Tufail on 29/03/2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .offset(y:300)
            HStack {
                ForEach(tabitems) { item in
                    VStack(spacing: 0) {
                        Image(systemName: item.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 80, height: 29)
                        Text(item.text)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                RoundedRectangle(cornerRadius: 34, style: .continuous))
            .strokeStyle()
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
