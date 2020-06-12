//
//  Converter.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

struct Converter {
    
    func convertToCelsius(farenheit: Double) -> Double {
//        return (farenheit - 32) * 5 / 9
        let farenMeasure = Measurement(value: farenheit, unit: UnitTemperature.fahrenheit)
        return farenMeasure.converted(to: UnitTemperature.celsius).value
    }
    
}
