//
//  SearchBarView.swift
//  BookScanner
//
//  Created by Andrew Z on 2021-10-16.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var isbn: String
    @Binding var foundBooks: Books?
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $isbn)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.isbn = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}


//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView(isbn: .constant(""))
//    }
//}
