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
    let reader: A5MK2Reader.LineReader
    
    init(_ reader: A5MK2Reader.LineReader) {
        self.reader = reader
    }
    
    private func setPhisicalName(_ pname: String) {
        self.pName = pname
    }
    
    private func setLogicalName(_ lname: String) {
        self.lName = lname
    }
    
    func build() -> Entity {
        self.reader.forEach {
            if ($0.isEmpty) {
                return
            }

            let element = $0.components(separatedBy: "=")
            if ($0.contains("PName")) {
                self.setPhisicalName(element[1])
            }
            if ($0.contains("LName")) {
                self.setLogicalName(element[1])
            }
        }
        
        return Entity(phisicalName: self.pName!, logicalName: self.lName!)
    }
}
