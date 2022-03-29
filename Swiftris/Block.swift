//
//  Block.swift
//  Swiftris
//
//  Created by Nicaely Joane on 03/03/22.
//

import SpriteKit

let numberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Red = 0
    case Teal = 1
    case Blue = 2
    case Orange = 3
    case Purple = 4
    case Yellow = 5
    
    
    var spriteName: String {
        switch self {
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func radom() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(numberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    
    // constants
    let color: BlockColor
    
    // properities
    var column: Int = 0
    var row: Int = 0
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

func == (lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
