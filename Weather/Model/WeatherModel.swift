//
//  WeatherModel.swift
//  Weather
//
//  Created by Alex Cannizzo on 13/09/2021.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    let description: String
    
    var tempAsString: String {
        String(format: "%.0f", temp)
    }
    
    var feelsLikeString: String {
        String(format: "%.0f", feelsLike)
    }
    
    var tempMinAsString: String {
        String(format: "%.0f", tempMin)
    }
    
    var tempMaxAsString: String {
        String(format: "%.0f", tempMax)
    }
    
    var humidityAsString: String {
        String(format: "%.0f", humidity)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...771:
            return "sun.dust"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
}
