
import Foundation

struct NewsModel: Decodable, Identifiable {
    let id = UUID()
    let articles : [Article]
}

struct Article: Decodable, Identifiable {
    let id = UUID()
    let source : Source
    let title : String
    let description : String
    let url : String
    let urlToImage : String
}

struct Source: Decodable {
    let name : String
}
