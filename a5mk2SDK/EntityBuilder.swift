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
        while(self.reader.hasNext()) {
            let line = self.reader.next()
            if (line.isEmpty) {
                break
            }
            if (line.contains("PName")) {
                let element = line.components(separatedBy: "=")
                self.setPhisicalName(element[1])
            }
            if (line.contains("LName")) {
                let element = line.components(separatedBy: "=")
                self.setLogicalName(element[1])
            }
        }
        
        return Entity(phisicalName: self.pName!, logicalName: self.lName!)
    }
}
