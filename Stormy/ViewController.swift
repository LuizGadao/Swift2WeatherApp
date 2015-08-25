//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 5/12/15.
//  Copyright (c) 2015 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dailyWeather:DailyWeather? {
        didSet{
            configureView()
        }
    }
    
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var sunriseLabel: UILabel?
    @IBOutlet weak var sunsetLabel: UILabel?
    @IBOutlet weak var lowTemperatureLabel: UILabel?
    @IBOutlet weak var hightTemperatureLabel: UILabel?
    @IBOutlet weak var precipatationLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    
    
    func configureView(){
        
        self.title = dailyWeather?.day
        weatherIcon?.image = dailyWeather?.largeIcon
        summaryLabel?.text = dailyWeather?.summary
        sunriseLabel?.text = dailyWeather?.sunriseTime
        sunsetLabel?.text = dailyWeather?.sunsetTime
        
        if let lowTemp = dailyWeather?.minTemperature,
            let hightTemp = dailyWeather?.maxTemperature,
            let precipitation = dailyWeather?.precipChange,
            let humidity = dailyWeather?.humidity{
                
                lowTemperatureLabel?.text = "\(lowTemp)º"
                hightTemperatureLabel?.text = "\(hightTemp)º"
                precipatationLabel?.text = "\(precipitation)%"
                humidityLabel?.text = "\(humidity)%"
        }
        
        
        //configure navbar backbutton
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let barButtonAttributesDictionary: [String: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: buttonFont
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, forState: .Normal)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

