//
//  SheetView.swift
//  BookScanner
//
//  Created by Andrew Z on 2021-10-13.
//

import SwiftUI

struct SheetView: View {
    @Binding var isbn: String
    @Binding var foundBooks: Books?
    @State private var isPresented = true

    var body: some View {
        Text("SCAN and Return to Info Tab")
                BarCodeScanner(isbn: $isbn, foundBooks: $foundBooks)    
    }
}


