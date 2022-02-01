//
//  Photo.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation

struct Photo: Identifiable, Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
