//
//  DroneCollectionViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 5/3/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DroneCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        setupInputComponents()
    }
    
    func setupInputComponents(){
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
