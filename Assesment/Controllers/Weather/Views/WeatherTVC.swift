//
//  WeatherTVC.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class WeatherTVC: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    func configure(_ weather: WeatherModel) {
        cityNameLabel.text = weather.name
        tempDescriptionLabel.text = weather.weather?.first?.main
        tempLabel.text = weather.main?.temp?.toDegree
    }

}
