//
//  ViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 4/6/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit
import AVFoundation
import AFNetworking

class IntroViewController: UIViewController {

    var Player: AVPlayer!
    var PlayerLayer: AVPlayerLayer!
    
    @IBOutlet weak var registrarText: CustomButton!
    @IBOutlet weak var descripcionText: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let URL = Bundle.main.url(forResource: "IntroDron-e", withExtension: "mp4")
        Player = AVPlayer.init(url: URL!)
        
        PlayerLayer = AVPlayerLayer(player: Player)
        PlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        PlayerLayer.frame = view.layer.frame
        Player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        Player.play()
        view.layer.insertSublayer(PlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: Player.currentItem)
        registrarText.isHidden = false
        descripcionText.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Player.pause()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Player.pause()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navigationBarAppereance = self.navigationController!.navigationBar
        navigationBarAppereance.isHidden = true
        Player.play()
    }
    
    func playerItemReachEnd(notification: NSNotification){
        Player.seek(to: kCMTimeZero)
    }

    @IBAction func registrarMTC(_ sender: Any) {
        
        performSegue(withIdentifier: "GoToSignIn", sender: self)
        /*
        let params: [String:Any] = [
            "application": [
                "appId":"myApp3"
            ]
        ]
        
        manager.requestSerializer = AFJSONRequestSerializer()
        
        manager.post("/m2m/applications", parameters: params, progress: { (progress) in
            
        }, success: { (task:URLSessionDataTask, response) in
            let dictionaryResponse: NSDictionary = response! as! NSDictionary
            print(dictionaryResponse)
            let alertController = UIAlertController(title: "Aplicacion registrada", message: dictionaryResponse["msg"] as? String, preferredStyle: .alert)
            
            let volverAction = UIAlertAction(title: "Regresar", style: .default) { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(volverAction)
            self.present(alertController, animated: true){
            }
        }) { (task: URLSessionDataTask?, error: Error) in
            self.showAlert(title: "Error en la solicitud", message: error.localizedDescription, closeButtonTitle: "Cerrar")
        }
        */

    }
    
    func showAlert(title: String, message:String, closeButtonTitle:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: closeButtonTitle, style: .default) { (action: UIAlertAction) in
            //Ejecutar algun codigo
        }
        alertController.addAction(cancelAction)
        self.present(alertController,animated: true){
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

