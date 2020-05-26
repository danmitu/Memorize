//
//  Array+Only.swift
//  Memorize
//
//  Created by Dan Mitu on 5/25/20.
//  Copyright © 2020 Dan Mitu. All rights reserved.
//

import Foundation

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
