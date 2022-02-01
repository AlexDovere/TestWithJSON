//
//  String+.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
