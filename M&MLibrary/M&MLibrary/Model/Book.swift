//
//  Book.swift
//  M&MLibrary
//
//  Created by My3 Shenoy on 1/25/22.
//

import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        LibrarySymbol.letterSquare(letter: title.first).image
    }
}
