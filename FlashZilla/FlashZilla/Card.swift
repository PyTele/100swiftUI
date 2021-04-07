//
//  Card.swift
//  FlashZilla
//
//  Created by Hubert Leszkiewicz on 03/04/2021.
//

import Foundation

struct Card: Codable {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
