//
//  Entity.swift
//  a5mk2SDK
//
//  Created by matsumoto on 2019/09/04.
//  Copyright © 2019 zyyx. All rights reserved.
//

import Foundation

class Entity: Equatable {
    static func == (lhs: Entity, rhs: Entity) -> Bool {
        lhs.pName == rhs.pName
    }
    
    
    private let pName: String
    init(_ pName: String) {
        self.pName = pName
    }
}
