//
//  DronViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 5/3/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit
import AFNetworking
import AVFoundation
import MobileCoreServices

class DronViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    let countries = ["Argentina", "Bolivia", "Brazil", "Canada", "China", "Colombia", "Ecuador", "England", "France","Germany", "Jamaica", "Japan", "Mexico", "United States", "Russia", "Venezuela"]
    let categoryPicker = UIPickerView()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryPickerText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registrarAplicacion()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPickerText.delegate = self
        customPicker()
    }
    
    func registrarAplicacion(){
        
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
            GlobalVariables.sharedInstance.displayAlertMessage(view: self, messageToDisplay: "Error en la solicitud")
        }
        
    }
    
    func customPicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        categoryPickerText.inputAccessoryView = toolbar
        categoryPickerText.inputView = categoryPicker
    }
    
    func donePressed(){
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == categoryPicker {
            return countries[row]
        }
        else{
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPicker {
            self.categoryPickerText.text = countries[0]
            return countries.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPicker {
            categoryPickerText.text = countries[row]
        }
    }
    
    func handleUploadTap(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = [kUTTypeImage]
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func subirFoto(_ sender: Any) {
        print("Entro")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    
}
