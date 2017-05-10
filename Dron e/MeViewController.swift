//
//  MeViewController.swift
//  Dron e
//
//  Created by DANIEL SANTIAGO JUNCO HURTADO on 10/05/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import Foundation
class MeViewController : UIViewController, MSBClientManagerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var stairsLabel: UILabel!
    @IBOutlet weak var calsLabel: UILabel!
    @IBOutlet weak var skinResistnaceLabel: UILabel!
    @IBOutlet weak var skinTemperatureLabel: UILabel!
    
    var connectedClient : MSBClient?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectedClient = BandConnectionManager.defaultManager.registerForEvents(self)
    }
    
    func startSensorUpdates() {
        startBandContactSensor()
        startAltimeterSensor()
        startCalorieSensor()
        startGSRSensor()
        startSkinTemperatureSensor()
        startPedometerSensor()
    }
    
    func startBandContactSensor() {
        do {
            try connectedClient?.sensorManager.startBandContactUpdates(to: nil, withHandler: { (data, error) in
                switch data?.wornState {
                case .worn :
                    self.nameLabel.text = "Wonderful, you are wearing your band!"
                case .notWorn :
                    self.nameLabel.text = "Oh, did you forget to get your band on today?"
                case .unknown :
                    self.nameLabel.text = "Sorry, but I can't find your band :("
                }
            })
        } catch {
            print("sensor error - band contact state can't be retrieved")
        }
    }
    
    func startAltimeterSensor() {
        do {
            try connectedClient?.sensorManager.startAltimeterUpdates(to: nil, withHandler: { (data, error) in
                    self.stairslabel.text = "\(data?.steppingGain)"
            })
            
        } catch {
            print("sensor error - altimeter sensor data can't be retrieved")
        }
    }
    
    func startCalorieSensor() {
        do {
            try connectedClient?.sensorManager.startCaloriesUpdates(to: nil, withHandler: { (data, error) in
                self.caloriesLabel.text = "\(data?.caloriesToday)"
            })
        } catch {
            print("sensor error - calories sensor data can't be retrieved")
        }
    }
    
    func startGSRSensor() {
        do {
            try connectedClient?.sensorManager.startGSRUpdates(to: nil, withHandler: { (data, error) in
                self.skinResistanceLabel.text = "\(data?.resistance)"
            })
        } catch {
            print("sensor error - GSR sensor data can't be retrieved")
        }
    }
    
    func startSkinTemperatureSensor() {
        do {
            try connectedClient?.sensorManager.startSkinTempUpdates(to: nil, withHandler: { (data, error) in
                self.skinTemperatureLabel.text = "\(data?.temperature)"
            })
        } catch {
            print("sensor error - skin temperature sensor data can't be retrieved")
        }
    }
    
    func startPedometerSensor() {
        do {
            try connectedClient?.sensorManager.startPedometerUpdates(to: nil, withHandler: { (data, error) in
                self.stepsLabel.text = "\(data?.stepsToday)"
            })
        } catch {
            print("sensor error - altimeter sensor data can't be retrieved")
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
