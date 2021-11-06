//
//  BookList.swift
//  BookScanner
//
//  Created by Andrew Z on 2021-10-14.
//

import Foundation
import SwiftUI

struct BookList {
    @Binding var foundBooks: Books?
    @Binding var bookArray: [Books]
    func addList () {
        print("ADDING")
        let title = Text("\(foundBooks?.items.first?.volumeInfo.title ?? "Title")")
        checkTitle(title: title)
    }
    
    func checkTitle (title: Text)  {
        if (title != Text("Title")) {
            print("appended")
            bookArray.append(foundBooks!)
        }
        print("failure")
    }
    
    
}

