
import SwiftUI

enum Tab {
    case Info
    case Scanner
    case Search
}


struct ContentView: View {
    
    @State private var isPresented = false
    @State private var isbn: String = ""
    @State private var foundBooks: Books?
    @State private var selection: Tab = .Info
    @State private var bookArray: [Books] = []
    @State private var title: Text = Text("Title")
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            switch selection {
            case .Info:
                NavigationView{
                    bookInfoView(isbn: $isbn, foundBooks: $foundBooks)
                        .ignoresSafeArea()
                }
            case .Scanner:
                NavigationView{
                    scannerView(isbn: $isbn, foundBooks: $foundBooks, isPresented: $isPresented, selection: $selection)
                        .ignoresSafeArea()
                }
            case .Search:
                NavigationView{
                    searchView(isbn: $isbn, foundBooks: $foundBooks)
                        .ignoresSafeArea()
                }
            }
            customTabView(selection: $selection, isPresented: $isPresented)
                .frame(height: 50)
        }
        
            
            
            
        }
        
    
    
}

struct customTabView: View {
    @Binding var selection: Tab
    @Binding var isPresented: Bool
    var body: some View {
        HStack{
            
            Spacer()
            Button{
                selection = .Info
            }label: {
                VStack{
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("Book Info")
                        .foregroundColor(.primary)
                        .font(.caption2)
                }
                .foregroundColor(selection == .Info ? .blue : .primary)
            }
            
            Spacer()
            Button {
                selection = .Scanner
                isPresented.toggle()
            }label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "barcode")
                        .resizable()
                        .foregroundColor(.primary)
                        .frame(width: 52, height: 52)
                }
                .offset(y: -32)
            }
            Spacer()
            Button{
                selection = .Search
            }label: {
                VStack{
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("Search")
                        .foregroundColor(.primary)
                        .font(.caption2)
                }
                .foregroundColor(selection == .Search ? .blue : .primary)
            }
            Spacer()
        }
    }
}

struct bookInfoView: View {
    @Binding var isbn: String
    @Binding var foundBooks: Books?
    var body: some View {
        
            VStack(){
                Form() {
                    Text("Book Info")
                        .font(.title)
                        .frame(alignment: .leading)
                    Text("\(foundBooks?.items.first?.volumeInfo.title ?? "Title")")
                    Text("\(foundBooks?.items.first?.volumeInfo.subtitle ?? "Subtitle")")
                    Text("\(foundBooks?.items.first?.volumeInfo.authors.first ?? "Author")")
                    
                }
                .frame(width: 410, height: 310, alignment: .topLeading)
                
                
                List() {
                    Section(header: Text("ADDITIONAL INFO")){
                        Text("\(foundBooks?.items.first?.volumeInfo.publishedDate ?? "Published date")")
                        Text("\(foundBooks?.items.first?.volumeInfo.pageCount ?? 0) Pages")
                        Text("\(foundBooks?.items.first?.volumeInfo.language ?? "Language")")
                        Text("ISBN: \(isbn)")
                    }
                    .frame(width: 260, height: 20, alignment: .leading)
                    
                    
                }
                .frame(width: 395, height: 400, alignment: .leading)
                
                
                .navigationTitle("About the Book 📖")
        }
            
    }
}

struct scannerView: View {
    @Binding var isbn: String
    @Binding var foundBooks: Books?
    @Binding var isPresented: Bool
    @Binding var selection: Tab
    var body: some View {
        VStack{
            Text("After Scanning Return to the Book Tab")
                .position(x: 185, y: -150)
                .background(Color(.blue))
        }
        
        .sheet(isPresented: $isPresented){
            SheetView(isbn: $isbn, foundBooks: $foundBooks)
           
        }
    }
    
}
struct searchView: View {
    @Binding var isbn: String
    @Binding var foundBooks: Books?
    var body: some View {
        VStack {
            SearchBarView(isbn: $isbn, foundBooks: $foundBooks)
                .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.20)
                .navigationTitle("Search")
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
