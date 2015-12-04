//
//  Prime.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

class PrimeGenerator: GeneratorType {
    typealias Element = Int
    
    var primes = [2,3]

    func next() -> PrimeGenerator.Element? {
        var n = primes.last! + 2
        while (true) {
            let primesToCheck = primes.takeWhile {($0!^^2) < n}
            if (primesToCheck.contains {n % $0 == 0}) {
                n += 2
            } else {
                primes.append(n)
                return n
            }
        }
    }
    
    subscript(idx: Int) -> Int {
        while (idx >= primes.count) {
            self.next()
        }
        return primes[idx]
    }
    func contains(n: Int) -> Bool {
        while (n >= primes.last!) {
            self.next()
        }
        return primes.contains(n)
    }
}

class Prime : SequenceType {
    typealias Element = Int
    let generator = PrimeGenerator()
    func generate() -> AnyGenerator<Element> {
        var idx = 0
        return anyGenerator({
            idx++
            return self.generator[idx-1]
        })
    }
    
    subscript(idx: Int) -> Int {
        return generator[idx]
    }
    func contains(element: Element) -> Bool {
        return generator.contains(element)
    }
}

private let PrimeNumbers = Prime()

import Darwin

extension Int {
    static func nthPrime(n: Int) -> Int {
        return PrimeNumbers[n]
    }
    var isPrime: Bool {
        return PrimeNumbers.contains(self)
    }
    var primeFactor: [Int] {
        if (self <= 1) {
            return []
        }
        for p in PrimeNumbers {
            if (self % p == 0) {
                return [p] + (self/p).primeFactor
            }
        }
        return [self]
    }
    var divisors: [Int] {
        let l = Int(floor(sqrt(Double(self))))
        let divisors = (1...l)
            .filter {self % $0 == 0}
            .map {
                n -> [Int] in
                if (n != self / n) {
                    return [n, self / n]
                } else {
                    return [n]
                }
            }
            .reduce([], combine: (+))
        return divisors.sort()
    }
    var properDivisors: [Int] {
        return self.divisors.filter {
            $0 != self
        }
    }
}