//
//  AppStrings.swift
//  Assesment
//
//  Created by Mayank Juyal on 23/02/21.
//

import Foundation

enum AppStrings: String {
    
    case navLogin = "Login"
    case error = "Error"
    case navWeather = "Weather"
    case emptyFields = "Fields cannot be empty"
    case authenticating = "Authenticating..."
    case ok = "Ok"
    
    var string: String {
        return self.rawValue
    }
    
}
