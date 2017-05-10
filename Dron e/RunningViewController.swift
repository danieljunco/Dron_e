//
//  RunningViewController.swift
//  Dron e
//
//  Created by DANIEL SANTIAGO JUNCO HURTADO on 10/05/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

class RunningViewController: UIViewController, MSBClientManagerDelegate {
    
    @IBOutlet weak var rutinaLabel: UILabel!
    @IBOutlet weak var pasoLabel: UILabel!
    @IBOutlet weak var velocidadLabel: UILabel!
    @IBOutlet weak var distanciaLabel: UILabel!
    
    var connectedClient : MSBClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectedClient = BandConnectionManager.defaultManager.registerForEvents(self)
        
        if let _ = self.connectedClient {
            startDistanceSensor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startSensorUpdates () {
        startDistanceSensor()
    }
    
    func startDistanceSensor () {
        do {
            try self.connectedClient?.sensorManager.startDistanceUpdates(to: nil, withHandler: { (data, error) in
                switch data?.motionType {
                case .idle: self.rutinaLabel.text = "Idling around"
                case .walking: self.rutinaLabel.text = "Nice walking"
                case .jogging : self.rutinaLabel.text = "Nice jogging"
                case .running : self.rutinaLabel.text = "Go on running!"
                case .unknown : self.rutinaLabel.text = "..."
                }
                
                self.pasoLabel.text = String(format: "%.2f min/km", (data?.pace)!*1000/60000)
                self.velocidadLabel.text = String(format: "%.2f km/h", (data?.speed)!/100000*3600)
                self.distanciaLabel.text = String(format: "%d km", (data?.totalDistance)!/1000)
            })
        } catch {
            
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


