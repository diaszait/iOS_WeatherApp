//
//  WeatherViewModel.swift
//  iOS_WeatherApp1
//
//  Created by Dias Zait on 29.09.2023.
//

import Foundation
import UIKit

protocol WeatherViewModelType {
    
    var didTapSearch: (() -> ())? { get set }
    
    var updateSearch: ((Welcome) -> ())? { get set }
    
    func fetchWeatherData(for cityName: String)
}

class WeatherViewModel: WeatherViewModelType {
    
    private var weatherService: WeatherService!
    private(set) var weatherData : Welcome? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    private var weekWeatherService: WeatherService!
    private(set) var weekWeatherData : weekWelcome? {
        didSet {
            self.bindWeekWeatherViewModelController()
        }
    }
    
    var bindWeekWeatherViewModelController : (() -> ()) = {}
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    var updateSearch: ((Welcome) -> ())?
    
    var updateWeek: ((weekWelcome) -> ())?
    
    lazy var didTapSearch: (() -> ())? = { [weak self] in
        
    }
    
    init() {
        self.weatherService = WeatherService()
        self.weekWeatherService = WeatherService()
        fetchWeatherData(for: "Barcelona")
        fetchWeekWeatherData(for: "Barcelona")
    }
    
    func fetchWeatherData(for cityName: String) {
        weatherService.fetchWeather(for: cityName) { (weatherData) in
            self.weatherData = weatherData
            self.updateSearch?(weatherData)
        }
    }
    
    func fetchWeekWeatherData(for cityName: String) {
        weekWeatherService.fetchWeekWeather(for : cityName) { (weekWeatherData) in
            self.weekWeatherData = weekWeatherData
            self.updateWeek?(weekWeatherData)
        }
    }
}

