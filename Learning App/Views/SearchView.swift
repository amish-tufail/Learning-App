//
//  SearchView.swift
//  Learning App
//
//  Created by Amish Tufail on 19/04/2022.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationModel // for Done Button
    var body: some View {
        NavigationView {
            List {                                               // or show all when nothing in field
                ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
                    Text(item.title)
                }
                // courses.filter { $0.title.contains(text)} filter out the result based on what gets typed in text field
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design")) // for the search field
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline) // to make the search bar not go in to larger mode
            .navigationBarItems(trailing: Button { presentationModel.wrappedValue.dismiss() } label: { Text("Done").bold() }) // Adds the Done button
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
