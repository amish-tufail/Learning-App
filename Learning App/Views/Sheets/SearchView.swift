//
//  SearchView.swift
//  Learning App
//
//  Created by Amish Tufail on 19/04/2022.
//

import SwiftUI
import AudioToolbox

struct SearchView: View {
    let generator = UISelectionFeedbackGenerator()
    @State var text = ""
    @State var show = false
    @Namespace var namespace
    @State var selectedIndex = 0
    @Environment(\.presentationMode) var presentationModel // for Done Button
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1")
                        .offset(x: -100, y: -200)
                )
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design")) { // for the search field
                ForEach(suggestions) { suggestion in // For Suggestion
                    Button {
                        text = suggestion.text
                        generator.selectionChanged()
                    } label: {
                        Text(suggestion.text) // to show suggestions
                            .searchCompletion(suggestion.text) // puts the suggestion on the field
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline) // to make the search bar not go in to larger mode
            .navigationBarItems(trailing: Button {
                presentationModel.wrappedValue.dismiss()
                generator.selectionChanged()
            } label: { Text("Done").bold() }) // Adds the Done button
            .sheet(isPresented: $show) {
                CourseView(namespace: namespace, course: courses[selectedIndex], show: $show)
            }
        }
    }
    
    var content: some View {
        // allows for the index
        ForEach(Array(courses.enumerated()), id: \.offset) { index, item in
            // courses.filter { $0.title.contains(text) || text == "" }
            // Both same thing the first one is implemented in the for each () and other in if
            // or show all when nothing in field
            if item.title.contains(text) || text == "" {
                if index != 0 { Divider() }
                Button {
                    show = true
                    selectedIndex = index
                    generator.selectionChanged()
                } label: {
                    HStack(alignment: .top, spacing: 12) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(Circle()) // Rounds the image
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .bold()
                                .foregroundColor(.primary)
                            Text(item.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 4) // internal padding
                    .listRowSeparator(.hidden)
                }
            }
        }
        // courses.filter { $0.title.contains(text)} filter out the result based on what gets typed in text field
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
