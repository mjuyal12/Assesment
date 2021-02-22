//
//  WeatherDetailsVC.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import UIKit

class WeatherDetailsVC: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var viewModel: WeatherDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVM()
    }
    
    private func configureVM() {
        viewModel.updateUI { [weak self] (cityName, weather, temp, iconURL) in
            guard let strongSelf = self else {return}
            strongSelf.updateView(cityName: cityName,
                                  weather: weather,
                                  temp: temp,
                                  iconURL: iconURL)
        }
    }

    private func updateView(cityName: String?, weather: String?, temp: Float?, iconURL: String?) {
        title = cityName
        weatherLabel.text = weather
        tempLabel.text = temp?.toDegree
        weatherImageView.setIcon(usingURL: iconURL ?? "")
    }
}
