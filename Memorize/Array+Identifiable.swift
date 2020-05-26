//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Dan Mitu on 5/25/20.
//  Copyright © 2020 Dan Mitu. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
