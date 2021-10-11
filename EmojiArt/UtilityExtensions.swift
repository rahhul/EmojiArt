//
//  UtilityExtensions.swift
//  EmojiArt
//
//  Created by Rahul on 10/10/21.
//

import Foundation
import SwiftUI

// Collections of Identifiables
// find the element that has the same id
extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}








// CGPOINTS and CGSIZES and CGRECTS
// convenience functions for adding/subtracting CGPoints and CGSizes
// might come in handy when doing gesture handling
// because we do a lot of converting between coordinate systems and such

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}

















































































































































































































