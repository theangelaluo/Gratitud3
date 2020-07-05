//
//  CreateScreen.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/4/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import UIKit

class CreateScreen: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var item1: UITextField!
    @IBOutlet weak var item2: UITextField!
    @IBOutlet weak var item3: UITextField!
    @IBOutlet weak var item1background: UIView!
    @IBOutlet weak var item2background: UIView!
    @IBOutlet weak var item3background: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prompt.font  = UIFont(name: "OpenSans-Light", size: 18)
        prompt.sizeToFit()
        
        // gradient layer
        var gradient = CAGradientLayer()
        gradient.frame = item1background.bounds
        let color2 = UIColor(red: 163.0/255.0, green: 10.0/255.0, blue: 111.0/255.0, alpha: 0.8)
        let color1 = UIColor(red: 253.0/255.0, green: 131.0/255.0, blue: 131.0/255.0, alpha: 0.8)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        item1background.layer.insertSublayer(gradient, at:0)
        
        
        // gradient layer
        gradient = CAGradientLayer()
        gradient.frame = item2background.bounds
        let color3 = UIColor(red: 159.0/255.0, green: 110.0/255.0, blue: 198.0/255.0, alpha: 0.5)
        let color4 = UIColor(red: 2/255.0, green: 39/255.0, blue: 234/255.0, alpha: 0.75)
        gradient.colors = [color3.cgColor, color4.cgColor]
        gradient.shouldRasterize = true
        item2background.layer.insertSublayer(gradient, at:0)
        
        
        // gradient layer
        gradient = CAGradientLayer()
        gradient.frame = item3background.bounds
        let color6 = UIColor(red: 255.0/255.0, green: 153.0/255.0, blue: 0.0/255.0, alpha: 0.8)
        let color5 = UIColor(red: 255.0/255.0, green: 42.0/255.0, blue: 29.0/255.0, alpha: 0.45)
        gradient.colors = [color5.cgColor, color6.cgColor]
        gradient.shouldRasterize = true
        item3background.layer.insertSublayer(gradient, at:0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
