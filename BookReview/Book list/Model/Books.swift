//
//  Books.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

struct DataFromJson: Decodable {
    var books: [Books]
    
//    init?(dict: [String: AnyObject]) {
//        guard let books = dict["books"] as? [Books] else { return nil }
//        self.books = books
//    }
}

struct Books: Decodable {
    
    let name: String
    let image: String
    let category: String
    let description: String
    let collectionImages: CollectionImages
    
//    init?(dict: [String: AnyObject]) {
//        guard let name = dict["name"] as? String,
//        let image = dict["image"] as? String,
//        let category = dict["category"] as? String,
//        let description = dict["description"] as? String,
//        let collectionImages = dict["collectionImages"] as? [CollectionImages] else { return nil }
//
//        self.name = name
//        self.image = image
//        self.category = category
//        self.description = description
//        self.collectionImages = collectionImages
//    }
}

struct CollectionImages: Decodable {
    let main: String
    let firstPage: String
    let secondPage: String
    
//    init?(dict: [String: String]) {
//        guard let main = dict["main"],
//        let firstChapter = dict["firstChapter"],
//        let secondChapter = dict["secondChapter"] else { return nil }
//        
//        self.main = main
//        self.firstChapter = firstChapter
//        self.secondChapter = secondChapter
//     }
}
