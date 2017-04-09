//
//  RegisterViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 4/7/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationBarAppereance = self.navigationController!.navigationBar
        navigationBarAppereance.isHidden = false
        navigationBarAppereance.barTintColor = UIColor.black
        navigationBarAppereance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBarAppereance.tintColor = UIColor.white
        navigationController!.toolbar.barTintColor = UIColor.black
        navigationController!.toolbar.isTranslucent = true
        navigationController!.toolbar.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
