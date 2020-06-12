//
//  Sieve.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

struct Sieve {
    static func calculatePrimes(upTo max: Int, completion: @escaping ([Int]) -> Void) {
        DispatchQueue.global().async {
            guard max > 1 else {
                return
            }
            
            var sieve = [Bool](repeating: true, count: max)
            
            sieve[0] = false
            sieve[1] = false
            
            for number in 2..<max {
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[multiple] = false
                    }
                }
            }
            
            let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
            
            completion(primes)
        }
    }
    
    static func calculatePrimes(upTo max: Int) -> [Int] {
        guard max > 1 else {
            return []
        }
        
        var sieve = [Bool](repeating: true, count: max)
        
        sieve[0] = false
        sieve[1] = false
        
        for number in 2..<max {
            if sieve[number] == true {
                for multiple in stride(from: number * number, to: sieve.count, by: number) {
                    sieve[multiple] = false
                }
            }
        }
        
        let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
        
        return primes
        
    }
}
