// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

 //MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Hashable {
    let source: Source?
    let author, title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}

// MARK: - Source
struct Source: Codable, Hashable{
    let id: String?
    let name: String?
}
//
//enum ID: String, Codable {
//    case googleNews = "google-news"
//}
//
//enum Name: String, Codable {
//    case googleNews = "Google News"
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation
//
//// MARK: - NewsResponse
//struct NewsResponse: Codable {
//    let status: String
//    let totalResults: Int
//    let articles: [Article]
//}
//
//// MARK: - Article
//struct Article: Codable, Hashable {
//    let source: Source
//    let author: String?
//    let title: String
//    let description: String?
//    let url: String
//    let urlToImage: String?
//    let publishedAt: Date?
//    let content: String?
//}
//
//// MARK: - Source
//struct Source: Codable, Hashable {
//    let id: String?
//    let name: String
//}
