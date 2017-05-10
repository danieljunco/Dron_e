//
//  EnvironmentViewController.swift
//  Dron e
//
//  Created by DANIEL SANTIAGO JUNCO HURTADO on 10/05/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//


import Foundation

class EnvironmentViewController : UIViewController, MSBClientManagerDelegate {
    
    @IBOutlet weak var airPressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    
    var connectedClient : MSBClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectedClient = BandConnectionManager.defaultManager.registerForEvents(self)
        
        if let _ = self.connectedClient {
            startSensorUpdates()
        }
    }
    
    func startSensorUpdates() {
        startUVIndexSensor()
        startBarometerSensor()
    }
    
    func startUVIndexSensor() {
        do {
            try connectedClient?.sensorManager.startUVUpdates(to: nil, withHandler: { (data, error) in
                switch data?.uvIndexLevel {
                case .low: self.uvIndexLabel.text = "Low"
                case .medium: self.uvIndexLabel.text = "Medium"
                case .high: self.uvIndexLabel.text = "High"
                case .veryHigh: self.uvIndexLabel.text = "Very high"
                case .none: self.uvIndexLabel.text = "No sun :/"
                }
            })
        } catch {
            print("sensor error - band uv sensor can't be retrieved")
        }
    }
    
    func startBarometerSensor() {
        do {
            try connectedClient?.sensorManager.startBarometerUpdates(to: nil, withHandler: { (data, error) in
                self.temperatureLabel.text = String(format: "%.2f °C", (data?.temperature)!)
                self.airPressureLabel.text = String(format: "%.2f hPa", (data?.airPressure)!)
            })
        } catch {
            print ("sensor error - barometer sensor can't be retrieved")
        }
    }
    
    func clientManager(_ clientManager: MSBClientManager!, clientDidConnect client: MSBClient!) {
        print("band connected")
        connectedClient = client
        startSensorUpdates()
    }
    
    func clientManager(_ clientManager: MSBClientManager!, clientDidDisconnect client: MSBClient!) {
        print("band disconnected")
    }
    
    func clientManager(_ clientManager: MSBClientManager!, client: MSBClient!, didFailToConnectWithError error: NSError!) {
        print("band failed to connect - whooooot")
    }
    
}

