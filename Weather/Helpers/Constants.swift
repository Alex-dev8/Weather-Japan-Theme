//
//  Constants.swift
//  Weather
//
//  Created by Alex Cannizzo on 13/09/2021.
//

import Foundation

struct Constants {
    static var API_KEY = "" // insert your API key here
    static var TEST_CITY = "london"
    static var API_URL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Constants.API_KEY)&units=metric"
}
