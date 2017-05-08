//
//  DroneTableViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 5/3/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

class DroneTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()

    }

    func setupComponents(){
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }


}
