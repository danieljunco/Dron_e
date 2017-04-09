//
//  DesignableView.swift
//  Dron e
//
//  Created by Daniel Junco on 4/7/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }

}
