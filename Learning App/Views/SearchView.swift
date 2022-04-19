//
//  SearchView.swift
//  Learning App
//
//  Created by Amish Tufail on 19/04/2022.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always)) // for the search field
            .navigationBarTitleDisplayMode(.inline) // to make the search bar not go in to larger mode
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
