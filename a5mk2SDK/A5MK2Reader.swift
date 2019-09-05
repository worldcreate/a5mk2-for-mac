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
            let reader = LineReader(text)

            var entities: Array<Entity> = []
            while(reader.hasNext()) {
                let line = reader.next()
                if line == "[Entity]" {
                    let entityBuilder = EntityBuilder(reader)
                    entities.append(entityBuilder.build())
                }
            }

            return entities
        } catch {
            print(error)
        }

        return []
    }

    class LineReader {
        private let lines: Array<String>
        private var count = 0
        init(_ text: String) {
            var lines: Array<String> = []
            text.enumerateLines { (line, stop) in
                lines.append(line)
            }
            self.lines = lines
        }
        
        func hasNext() -> Bool {
            self.lines.count > count
        }
        
        func next() -> String {
            let line = self.lines[self.count]
            self.count += 1
            return line
        }
    }
}
