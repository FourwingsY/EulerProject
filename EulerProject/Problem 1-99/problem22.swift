//
//  problem22.swift
//  EulerProject
//
//  Created by YG on 15/11/26.
//  Copyright © 2015 YG. All rights reserved.
//

func problem22() -> Int {
    let names = readFile("Data/data22.txt")
        .componentsSeparatedByString(",")
        .map {
            $0.substringWithRange(
                Range<String.Index>(start: $0.startIndex.advancedBy(1), end: $0.endIndex.advancedBy(-1)))
    }.sort()
    
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters
    let codes = (1...26)
    let alphabetCodes = tupleToDict(zip(alphabet, codes))
    let scores = names.map {
        $0.characters
            .map {alphabetCodes[$0]!}
            .reduce(0, combine: (+))
    }
    
    return zip((1 ... scores.endIndex), scores)
        .map {$0 * $1}
        .reduce(0, combine: (+))
}

func tupleToDict<T: Hashable, U, S1: SequenceType, S2: SequenceType
        where T == S1.Generator.Element, U == S2.Generator.Element>
        (tuples: Zip2Sequence<S1, S2>) -> [T:U] {
    var dict: [T:U] = [:]
    for tuple in tuples {
        dict[tuple.0] = tuple.1
    }
    return dict
}