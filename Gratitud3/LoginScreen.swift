//
//  LoginScreen.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/5/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        let color1 = UIColor(red: 229.0/255.0, green: 232.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let color2 = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        self.view.layer.insertSublayer(gradient, at:0)
    }
    


}
