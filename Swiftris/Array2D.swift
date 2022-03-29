//
//  Array2D.swift
//  Swiftris
//
//  Created by Nicaely Joane on 02/03/22.
//
class Array2D<Type> {
    let columns: Int
    let rows: Int
    
    var arr: Array<Type?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        arr = Array<Type?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> Type? {
        get {
            return arr[(row * columns) + column]
        }
        set(newValue) {
            arr[(row * columns) + column] = newValue
        }
    }
}
