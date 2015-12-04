//
//  problem28.swift
//  EulerProject
//
//  Created by YG on 15/12/2.
//  Copyright © 2015 YG. All rights reserved.
//

func problem28(spiralSize: Int) -> Int {
    if spiralSize == 1 {
        return 1
    }
    // not considering when spiralSize is even
    if spiralSize % 2 == 0 {
        return 0
    }
    return spiralDiagonalAverage(spiralSize) * 4 + problem28(spiralSize - 2)
}

func spiralDiagonalAverage(spiralSize: Int) -> Int {
    if spiralSize % 2 == 0 {
        return 0
    }
    return spiralSize * spiralSize - (spiralSize - 1) / 2 * 3
}