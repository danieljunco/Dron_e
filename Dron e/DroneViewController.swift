//
//  DroneViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 5/3/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

class DroneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setUp(){
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundView?.addSubview(containerView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
