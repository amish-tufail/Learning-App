//
//  AccountView.swift
//  Learning App
//
//  Created by Amish Tufail on 22/03/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        List {
            Section {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Billing")
                Text("Help")
            }
            .listRowSeparatorTint(.blue)
            .listRowSeparator(.hidden)
        }
        .listStyle(.automatic) // would adopt automatic to different devices
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
