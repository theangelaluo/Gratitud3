//
//  ProfileScreen.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/4/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController {
    
    let items = ["sunshine", "strength of mind", "WiFi", "Beyonce", "stand-up comedy", "fresh air", "bubble tea"]
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var gratitudeCollectionView: UICollectionView!
    @IBOutlet weak var settings: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicImageView.downloaded(from: "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/26219497_1613355575424328_6247065905212931905_n.jpg?_nc_cat=103&_nc_sid=85a577&_nc_oc=AQmbUZs_TQfhE4X1IQCPkFpo7j7JCIKMOk1xPt7HSKwvMRUxGLCXCEI1s4pR3SuNz38&_nc_ht=scontent-sjc3-1.xx&oh=0e1742d68e0d4988b1e08f70e3a44579&oe=5F287602")
        profilePicImageView.layer.cornerRadius = profilePicImageView.frame.size.height/2
        profilePicImageView.clipsToBounds = true
        profilePicImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = UIFont(name: "OpenSans", size: 30)
        nameLabel.sizeToFit()
        usernameLabel.font = UIFont(name: "OpenSans-Light", size: 20)
        usernameLabel.sizeToFit()
        
        gratitudeCollectionView.delegate = self
        gratitudeCollectionView.dataSource = self
        gratitudeCollectionView.register(SingleCell.self, forCellWithReuseIdentifier: "SingleCell")
        gratitudeCollectionView.showsVerticalScrollIndicator = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        settings.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InitialScreen") as! InitialScreen
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:false, completion:nil)
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


extension ProfileScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCell", for: indexPath) as! SingleCell
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.contentView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        cell.setItem()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = items[indexPath.row]
        label.textAlignment = .center
        label.font = UIFont(name: "OpenSans-Light", size: 38)
        cell.contentView.addSubview(label)
        
        if indexPath.row % 3 == 0 {
            // gradient layer
            let gradient = CAGradientLayer()
            gradient.frame = cell.bounds
            let color2 = UIColor(red: 163.0/255.0, green: 10.0/255.0, blue: 111.0/255.0, alpha: 0.8)
            let color1 = UIColor(red: 253.0/255.0, green: 131.0/255.0, blue: 131.0/255.0, alpha: 0.8)
            gradient.colors = [color1.cgColor, color2.cgColor]
            gradient.shouldRasterize = true
            cell.layer.insertSublayer(gradient, at:0)
        } else if indexPath.row % 3 == 1 {
            // gradient layer
            let gradient = CAGradientLayer()
            gradient.frame = cell.bounds
            let color3 = UIColor(red: 159.0/255.0, green: 110.0/255.0, blue: 198.0/255.0, alpha: 0.5)
            let color4 = UIColor(red: 2/255.0, green: 39/255.0, blue: 234/255.0, alpha: 0.75)
            gradient.colors = [color3.cgColor, color4.cgColor]
            gradient.shouldRasterize = true
            cell.layer.insertSublayer(gradient, at:0)
        } else {
            // gradient layer
            let gradient = CAGradientLayer()
            gradient.frame = cell.bounds
            let color6 = UIColor(red: 255.0/255.0, green: 153.0/255.0, blue: 0.0/255.0, alpha: 0.8)
            let color5 = UIColor(red: 255.0/255.0, green: 42.0/255.0, blue: 29.0/255.0, alpha: 0.45)
            gradient.colors = [color5.cgColor, color6.cgColor]
            gradient.shouldRasterize = true
            cell.layer.insertSublayer(gradient, at:0)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
}


class SingleCell: UICollectionViewCell {
    
    func setItem() {
        
    }
}
