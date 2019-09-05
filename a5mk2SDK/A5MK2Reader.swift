//
//  A5MK2Reader.swift
//  a5mk2SDK
//
//  Created by matsumoto on 2019/09/04.
//  Copyright © 2019 zyyx. All rights reserved.
//

import Foundation

class A5MK2Reader {
    let filePath: URL
    init(_ filePath: URL) {
        self.filePath = filePath
    }
    
    public func readAllEntities() -> Array<Entity> {
        
        do {

            let text = try String( contentsOf: self.filePath, encoding: String.Encoding.utf8 )
            var lines: Array<String> = []
            text.enumerateLines { (line, stop) in
                lines.append(line)
            }
            
            enum State: Int {
                case ENTITY
                case SKIP
            }
            
            var state: State = .SKIP
            var entities: Array<Entity> = []
            for i in 0..<lines.count {
                if (state == .SKIP) {
                    if (lines[i] == "[Entity]") {
                        state = .ENTITY
                        continue
                    }
                } else if (state == .ENTITY) {
                    let builder = EntityBuilder()
                    for line in lines[i...] {
                        if (line.isEmpty) {
                            break
                        }
                        if (line.contains("PName")) {
                            let element = line.components(separatedBy: "=")
                            builder.setPName(element[1])
                        }
                    }
                    entities.append(builder.build())
                    state = .SKIP
                }
            }

            return entities
        } catch {
            print(error)
        }
        
        return []
    }
    
    class LineReader {
        init(text: String) {
            
        }
    }
}
