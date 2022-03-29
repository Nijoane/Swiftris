//
//  Shape.swift
//  Swiftris
//
//  Created by Nicaely Joane on 10/03/22.
//

import SpriteKit

let NumOrientations: UInt32 = 4

enum Orientation: Int, CustomStringConvertible {
    case Zero = 0
    case Ninety = 90
    case OneEighty = 180
    case TwoSeventy = 270
    
    var description: String {
        switch self {
        case .Zero:
            return "0"
        case .Ninety:
            return "90"
        case .OneEighty:
            return "180"
        case .TwoSeventy:
            return "270"
        }
    }
    
    static func radom() -> Orientation {
        return Orientation(rawValue: Int(arc4random_uniform(NumOrientations)))!
    }
    
    static func rotate(orientation: Orientation, clockwise: Bool) -> Orientation {
        var rotated = orientation.rawValue + (clockwise ? 1 : -1)
        if rotated > Orientation.TwoSeventy.rawValue {
            rotated = Orientation.Zero.rawValue
        } else if rotated < 0 {
            rotated = Orientation.TwoSeventy.rawValue
        }
        return Orientation(rawValue: rotated)!
    }
}

let NumShapeTypes: UInt32 = 7

let firstBlockId: Int = 0
let secondBlockId: Int = 1
let thridBlockId: Int = 2
let fourthBlockId: Int = 3

class Shape: Hashable, CustomStringConvertible {
    let color: BlockColor
    
    var blocks = Array<Block>()
    var orientation = Orientation(rawValue: 0)
    var column, row: Int
    
    var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [:]
    }
    
    var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [:]
    }
    
    var bottomBlocks: Array<Block> {
        if bottomBlocksForOrientations[orientation!] != nil {
            return []
        }
        return self.bottomBlocks
    }
    
    var hashValue: Int {
        return blocks.reduce(0) { $0.hashValue ^ $1.hashValue }
    }
    
    var description: String {
        return "\(color) block facing \(String(describing: orientation)): \(blocks[firstBlockId]), \(blocks[secondBlockId]), \(blocks[thridBlockId]), \(blocks[fourthBlockId]) "
    }
    
    init(column: Int, row: Int, color: BlockColor, orientation: Orientation) {
        self.column = column
        self.row = row
        self.color = color
        self.orientation = orientation
        
        initializeBlocks()
    }
    
    convenience init(column: Int, row: Int) {
        self.init(column: column, row: row, color: BlockColor.radom(), orientation: Orientation.radom())
    }
    
    final func initializeBlocks() {
        guard
            let blockRowColumnTranslations =  blockRowColumnPositions[orientation!] else {
                return
            }
        blocks = blockRowColumnTranslations.map { (diff) -> Block in
            return  Block(column: column + diff.columnDiff, row: row + diff.rowDiff, color: color)
        }
    }
}
func == (lhs: Shape, rhs: Shape) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column
}
