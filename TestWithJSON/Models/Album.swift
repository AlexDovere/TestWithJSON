//
//  Album.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation

struct Album: Identifiable, Decodable {
    var userId: Int
    var id: Int
    var title: String
}
