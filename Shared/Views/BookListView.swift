//
//  BookListView.swift
//  BookScanner
//
//  Created by Andrew Z on 2021-10-14.
//

import SwiftUI

import SwiftUI

struct BookListView: View {

    @Binding var bookArray: [Books]



    
    var body: some View {
        ForEach(bookArray) { book in
            Text("\(book.items.first!.volumeInfo.title)")
    }
        
    }
}


