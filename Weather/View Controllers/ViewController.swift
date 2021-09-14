//
//  ViewController.swift
//  Weather
//
//  Created by Alex Cannizzo on 13/09/2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, WeatherManagerDelegate {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var weatherSymbol: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // MARK: - Properties
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()

    // MARK: - VDL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    
    // MARK: - Methods Weather Manager Delegate
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.conditionLabel.text = weather.description
            self.tempLabel.text = weather.tempAsString
            self.weatherSymbol.image = UIImage(systemName: "\(weather.conditionName)")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

