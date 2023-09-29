//
//  Extensions.swift
//  iOS_WeatherApp1
//
//  Created by Dias Zait on 29.09.2023.
//
import Foundation
import UIKit
import SnapKit

extension ViewController {
    func selectImageForWeather(_ weatherCondition: String) -> UIImage? {
        switch weatherCondition {
        case "clouds":
            return UIImage(named: "cloud")
        case "rain":
            return UIImage(named: "rain")
        case "clear":
            return UIImage(named: "sun")
        case "snow":
            return UIImage(named: "snow")
        default:
            return UIImage(named: "flash")
        }
    }
    
    func getImageForWeatherCondition(_ weatherCondition: weekMainEnum) -> UIImage? {
        switch weatherCondition {
        case .clouds:
            return UIImage(named: "cloud")
        case .clear:
            return UIImage(named: "sun")
        case .rain:
            return UIImage(named: "rain")
        case .flash:
            return UIImage(named: "flash")
        }
    }
}

extension SearchController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let cityName = textField.text {
            weatherViewModel.fetchWeatherData(for: cityName)
            weekViewModel.fetchWeekWeatherData(for: cityName)
            onSearch?(cityName)
        } else {
            print("No city name found")
        }
        
        closeButtonTapped()
        return true
    }
}

// MARK: - Configuration of the next five day views

extension WeatherDayView {
    func configure() {
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.8
    }
}

