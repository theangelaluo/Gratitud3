//
//  ViewController.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/4/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import UIKit

class InitialScreen: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heartLogo: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
        guard let openSansBold = UIFont(name: "OpenSans-Bold", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "open sans bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        
        
        // gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        let color1 = UIColor(red: 229.0/255.0, green: 232.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let color2 = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        self.view.layer.insertSublayer(gradient, at:0)
        
        titleLabel.font = UIFontMetrics.default.scaledFont(for: openSansBold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = titleLabel.font.withSize(35)
        titleLabel.sizeToFit()
        
        loginButton.titleLabel?.font = UIFont(name: "OpenSans", size: 25)
        loginButton.sizeToFit()
        
        signUpButton.titleLabel?.font = UIFont(name: "OpenSans", size: 25)
        signUpButton.sizeToFit()
        
//        heartLogo.frame = CGRect(x: heartLogo.frame.origin.x, y: titleLabel.frame.origin.y + titleLabel.frame.height + 1000, width: heartLogo.frame.size.width, height: heartLogo.frame.size.height)
    }


}

