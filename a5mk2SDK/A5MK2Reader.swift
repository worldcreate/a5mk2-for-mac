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
            reader.forEach {
                if $0 == "[Entity]" {
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

    class LineReader: Sequence, IteratorProtocol {
        typealias Element = String

        private let lines: Array<Element>
        private var count = 0
        init(_ text: String) {
            var lines: Array<Element> = []
            text.enumerateLines { (line, _) in
                lines.append(line)
            }
            self.lines = lines
        }

        func next() -> Element? {
            defer { count += 1 }
            return self.lines.count > count ? self.lines[self.count] : nil
        }
    }
}
