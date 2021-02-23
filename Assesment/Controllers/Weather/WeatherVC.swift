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
        configureVM()
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureHeader()
    }
    
    // MARK: - Private Method(s)
    private func configureHeader() {
        self.title = "Weather"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configureVM() {
        viewModel.error = { [weak self] (message) in
            guard let strongSelf = self else {return}
            Utility.showAlert(withTitle: "Error", andMessage: message, on: strongSelf)
        }
        viewModel.fetchedDetails = { [weak self] in
            self?.weatherTableView.reloadData()
        }
        viewModel.fetchWeatherDetails()
        viewModel.localDBWeatherDetails()
    }
    /**Adding Observer to the view controller for background*/
    private func addObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    /**Save data moved to Background*/
    @objc private func appMovedToBackground() {
        print("App moved to background!")
        viewModel.saveWeatherDetails()
    }

}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension WeatherVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: WeatherTVC = tableView.instantiateCell() {
            cell.configure(viewModel.getWeather(at: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetails(forRow: indexPath.row)
    }
}
