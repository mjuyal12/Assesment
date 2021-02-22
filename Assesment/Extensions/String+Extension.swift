//
//  String+Extension.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

extension String {
    
    func isBlank() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
}
