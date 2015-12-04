//
//  problem11.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem11(adjacent: Int) -> Int {
    let lines = readFile("Data/data11.txt").componentsSeparatedByString("\n")
    let numbersMap = lines.map {
        $0.componentsSeparatedByString(" ").map {
            Int($0)!
        }
    }
    let mapSize = numbersMap.count
    
    let horizontalIndicies: [(Int, Int)] = getIndicies(mapSize, y: mapSize-adjacent+1)
    let horizontalMax: Int = horizontalIndicies.map {
        (i, j) in
        (0..<adjacent).map {
            numbersMap[i][j+$0]
            }.reduce(1) {$0*$1}
        }.maxElement()!
    let verticalIndicies: [(Int, Int)] = getIndicies(mapSize-adjacent+1, y: mapSize)
    let verticalMax: Int = verticalIndicies.map {
        (i, j) in
        (0..<adjacent).map {
            numbersMap[i+$0][j]
            }.reduce(1) {$0*$1}
        }.maxElement()!
    let diagonalIndicies: [(Int, Int)] = getIndicies(mapSize-adjacent+1, y: mapSize-adjacent+1)
    let rightDownDiagonalMax: Int = diagonalIndicies.map {
        (i, j) in
        (0..<adjacent).map {
            numbersMap[i+$0][j+$0]
            }.reduce(1) {$0*$1}
        }.maxElement()!
    let rightUpDiagonalMax: Int = diagonalIndicies.map {
        (i, j) in
        let elements = (0..<adjacent).map {
            numbersMap[i+adjacent-1-$0][j+$0]
        }
        return elements.reduce(1) {$0 * $1}
        }.maxElement()!
    
    return [horizontalMax, verticalMax, rightDownDiagonalMax, rightUpDiagonalMax].maxElement()!
}

func getIndicies(x: Int, y: Int) -> [(Int, Int)] {
    let mapped = (0..<x).map {
        i in (0..<y).map {
            j in (i, j)
        }
    }
    return mapped.reduce([], combine: (+))
}
