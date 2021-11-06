
import Foundation

struct Books: Decodable, Identifiable {
    let id: String = "01"
    var items: [BookItem]
}

struct BookItem: Decodable, Identifiable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable, Identifiable {
    let id: String = "02"
    let title: String
    let subtitle: String?
    let authors: [String]
    let publishedDate: String
    let pageCount: Int
    let language: String
}

