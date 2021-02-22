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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ weather: WeatherModel) {
        cityNameLabel.text = weather.name
        tempDescriptionLabel.text = weather.weather?.first?.main
        let temp = weather.main?.temp ?? 0
        tempLabel.text = String(format: "%.2f", temp)
    }

}
