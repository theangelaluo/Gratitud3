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
    
    var delegate: CreatePostDelegate?
    
    @IBAction func post(_ sender: Any) {

        let newPost = PostModel("theangelaluo", "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/26219497_1613355575424328_6247065905212931905_n.jpg?_nc_cat=103&_nc_sid=85a577&_nc_oc=AQmbUZs_TQfhE4X1IQCPkFpo7j7JCIKMOk1xPt7HSKwvMRUxGLCXCEI1s4pR3SuNz38&_nc_ht=scontent-sjc3-1.xx&oh=0e1742d68e0d4988b1e08f70e3a44579&oe=5F287602", [item1.text!, item2.text!, item3.text!])
        delegate?.addPostToDashboard(post: newPost)
        item1.text = "Item 1"
        item2.text = "Item 2"
        item3.text = "Item 3"
        tabBarController?.selectedIndex = 0

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = tabBarController?.viewControllers?[0] as! HomeScreen

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


protocol CreatePostDelegate {
    func addPostToDashboard(post: PostModel)
}
