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
        lhs.pName == rhs.pName &&
            lhs.lName == rhs.lName
    }
    
    
    private let pName: String
    private let lName: String
    init(phisicalName pName: String, logicalName lName: String) {
        self.pName = pName
        self.lName = lName
    }
}
