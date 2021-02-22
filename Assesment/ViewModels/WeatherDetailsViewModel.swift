//
//  WeatherDetailsViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

class WeatherDetailsViewModel {
    
    var coordinator: WeatherDetailCoordinator?
    
    var weatherDetails: WeatherModel?
    
    typealias UpdateValues = ((String?, String?, Float?) -> Void)
    
    func updateUI(compeltion: UpdateValues) {
        compeltion(weatherDetails?.name, weatherDetails?.weather?.first?.main, weatherDetails?.main?.temp)
    }
    
}
