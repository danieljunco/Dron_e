//
//  BandConnectionController.swift
//  Dron e
//
//  Created by DANIEL SANTIAGO JUNCO HURTADO on 10/05/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import Foundation

class BandConnectionManager : NSObject, MSBClientManagerDelegate {
    
    static let defaultManager = BandConnectionManager()
    
    var observers : [MSBClientManagerDelegate]!
    var connectedClient : MSBClient?
    
    fileprivate override init() {
        super.init()
        observers = [MSBClientManagerDelegate]()
        watchForBands()
    }
    
    func watchForBands () {
        MSBClientManager.shared().delegate = self
        
        let attachedClients = MSBClientManager.shared().attachedClients()
        if let client = attachedClients?.first {
            self.connectedClient = client as! MSBClient
            MSBClientManager.shared().connect(self.connectedClient)
        }
    }
    
    func registerForEvents(_ observer: MSBClientManagerDelegate) -> MSBClient? {
        observers.append(observer)
        
        if let client = connectedClient {
            return client
        }
        
        return nil
    }
    
    func clientManager(_ clientManager: MSBClientManager!, clientDidConnect client: MSBClient!) {
        for observer in observers {
            observer.clientManager(clientManager, clientDidConnect: client)
        }
    }
    
    func clientManager(_ clientManager: MSBClientManager!, clientDidDisconnect client: MSBClient!) {
        for observer in observers {
            observer.clientManager(clientManager, clientDidDisconnect: client)
        }
    }
    
    func clientManager(_ clientManager: MSBClientManager!, client: MSBClient!, didFailToConnectWithError error: NSError!) {
        for observer in observers {
            observer.clientManager(clientManager, client: client, didFailToConnectWithError: error)
        }
    }
    
    
}

