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
    func setPName(_ pname: String) {
        self.pName = pname
    }
    
    func build() -> Entity {
        return Entity(self.pName!)
    }
}
