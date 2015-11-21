//
//  Sequence.swift
//  EulerProject
//

// get from: https://github.com/pNre/ExSwift/blob/Swift-2.0/ExSwift/Sequence.swift

extension SequenceType {
    func takeWhile (condition:(Self.Generator.Element?) -> Bool) -> AnySequence<Self.Generator.Element>  {
        return AnySequence(TakeWhileSequence(self, condition))
    }
    func groupBy<U : Hashable>(keyFunc: Generator.Element -> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            let _ = dict[key]?.append(el) ?? {dict[key] = [el]}()
        }
        return dict
    }
}

public struct TakeWhileSequence<S: SequenceType>: SequenceType {
    private let sequence: S
    private let condition: (S.Generator.Element?) -> Bool
    
    public init(_ sequence:S, _ condition:(S.Generator.Element?) -> Bool) {
        self.sequence = sequence
        self.condition = condition
    }
    
    public func generate() -> AnyGenerator<S.Generator.Element> {
        var generator = self.sequence.generate()
        var endConditionMet = false
        return anyGenerator {
            let next: S.Generator.Element? = generator.next()
            if !endConditionMet {
                endConditionMet = !self.condition(next)
            }
            if endConditionMet {
                return nil
            } else {
                return next
            }
        }
    }
}