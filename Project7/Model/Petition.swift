//
//  Petition.swift
//  Project7
//
//  Created by Ильфат Салахов on 06.02.2023.
//

import Foundation

struct Petitions: Codable {
    var results: [Petition]
}

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}


