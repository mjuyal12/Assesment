//
//  WeatherVC.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var viewModel: WeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
        configureVM()
        addObserver()
    }
    
    private func configureHeader() {
        self.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configureVM() {
        viewModel.fetchedDetails = { [weak self] in
            self?.weatherTableView.reloadData()
        }
        viewModel.fetchWeatherDetails()
        viewModel.localDBWeatherDetails()
    }
    
    private func addObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc private func appMovedToBackground() {
        print("App moved to background!")
        viewModel.saveWeatherDetails()
    }

}

extension WeatherVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTVC") as? WeatherTVC {
            cell.configure(viewModel.getWeather(at: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetails(forRow: indexPath.row)
    }
}
