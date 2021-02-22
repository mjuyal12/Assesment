//
//  WeatherDetailsVC.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import UIKit

class WeatherDetailsVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var viewModel: WeatherDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupHeader()
        configureVM()
    }
    
    private func setupHeader() {
        self.title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureVM() {
        viewModel.updateUI { [weak self] (cityName, weather, temp) in
            guard let strongSelf = self else {return}
            strongSelf.cityLabel.text = cityName
            strongSelf.weatherLabel.text = weather
            strongSelf.tempLabel.text = String(format: "%.2f", (temp ?? 0))
        }
    }

}
