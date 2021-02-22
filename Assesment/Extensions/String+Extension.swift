//
//  String+Extension.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

extension String {
    
    /// Check for the string if is empty
    /// - Returns: Bool if empty
    func isBlank() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
}

extension Float {
    
    /// Converts and shows unit
    var toDegree: String {
        let doubleValue = Double(self)
        let formatter = MeasurementFormatter()
        formatter.locale = Locale.current
        let measurement = Measurement(value: doubleValue, unit: UnitTemperature.celsius)
        let stringTemp = formatter.string(from: measurement)
        return stringTemp
    }
    
}
