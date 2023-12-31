//
//  WeatherDayView.swift
//  iOS_WeatherApp1
//
//  Created by Dias Zait on 29.09.2023.
//

import Foundation
import UIKit
import SnapKit

class WeatherDayView: UIView {
    
    // MARK: - Properties
    
    let tempLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "10°C"
        tempLabel.textColor = .black
        tempLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        return tempLabel
    }()
    
    let weatherIcon : UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    
    private func setupView() {
        addSubview(tempLabel)
        addSubview(weatherIcon)
        
        tempLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(snp.centerX)
            make.bottom.equalTo(snp.bottom).inset(10)
        }
        
        weatherIcon.snp.makeConstraints{ make in
            make.bottom.equalTo(tempLabel.snp.top).offset(-12)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
    }
}

