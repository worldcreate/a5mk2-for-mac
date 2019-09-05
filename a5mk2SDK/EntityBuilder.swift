//
//  EntityBuilder.swift
//  a5mk2SDK
//
//  Created by matsumoto on 2019/09/05.
//  Copyright © 2019 zyyx. All rights reserved.
//

import Foundation

class EntityBuilder {
    var pName: String? = nil
    var lName: String? = nil
    
    func setPhisicalName(_ pname: String) {
        self.pName = pname
    }
    
    func setLogicalName(_ lname: String) {
        self.lName = lname
    }
    
    func build() -> Entity {
        return Entity(phisicalName: self.pName!, logicalName: self.lName!)
    }
}
