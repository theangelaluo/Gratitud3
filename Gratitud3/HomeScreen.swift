//
//  HomeScreen.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/4/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var overallCollectionView: UICollectionView!
    
    var pc: UIPageControl = UIPageControl()
    
    let stuff = ["family", "friends", "chicken"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        topTitle.font  = UIFont(name: "OpenSans-Light", size: 15)
        topTitle.sizeToFit()
        
        
        overallCollectionView.delegate = self
        overallCollectionView.dataSource = self
        overallCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        overallCollectionView.showsVerticalScrollIndicator = false
        
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        layout.scrollDirection = .horizontal
//
//        let singleCollectionView:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 128, width: self.view.frame.width, height: 150), collectionViewLayout: layout)
//        singleCollectionView.delegate = self
//        singleCollectionView.dataSource = self
//        singleCollectionView.isPagingEnabled = true
//
//        singleCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "item")
//
//        singleCollectionView.backgroundColor = UIColor.white
//        singleCollectionView.showsVerticalScrollIndicator = false
//        self.view.addSubview(singleCollectionView)
//
//        pc.frame = CGRect(x: 0, y: 150, width: 100, height: 50)
//        pc.currentPage = 0
//        pc.numberOfPages = 3
//        pc.currentPageIndicatorTintColor = .darkGray
//        pc.pageIndicatorTintColor = .lightGray
//        self.view.addSubview(pc)
        
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


extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.setItem()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
    
    
}


class PostCell: UICollectionViewCell {
    
    var pc = UIPageControl()
    
    func setItem() {
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.contentView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let username = UILabel(frame: CGRect(x: 43, y: 10, width: 132, height: 36))
        username.text = "theangelaluo"
        username.font = UIFont(name: "OpenSans", size: 18)
        username.sizeToFit()
        self.contentView.addSubview(username)
        
        let profilePicImageView = UIImageView()
        profilePicImageView.downloaded(from: "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/26219497_1613355575424328_6247065905212931905_n.jpg?_nc_cat=103&_nc_sid=85a577&_nc_oc=AQmbUZs_TQfhE4X1IQCPkFpo7j7JCIKMOk1xPt7HSKwvMRUxGLCXCEI1s4pR3SuNz38&_nc_ht=scontent-sjc3-1.xx&oh=0e1742d68e0d4988b1e08f70e3a44579&oe=5F287602")
        profilePicImageView.frame = CGRect(x: 7, y: 10, width: 27, height: 27)
        profilePicImageView.layer.cornerRadius = profilePicImageView.frame.size.height/2
        profilePicImageView.clipsToBounds = true
        profilePicImageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(profilePicImageView)
        
        
        let heartView = UIImageView()
        heartView.image = UIImage(systemName: "heart")
        heartView.image?.withTintColor(.black)
        heartView.frame = CGRect(x: self.contentView.frame.maxX - 27 - 10, y: 10, width: 27, height: 27)
        heartView.clipsToBounds = true
        heartView.contentMode = .scaleAspectFill
        heartView.isUserInteractionEnabled = true
        self.contentView.addSubview(heartView)
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let singleCollectionView:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 45, width: self.contentView.frame.width, height: 150), collectionViewLayout: layout)
        
        singleCollectionView.backgroundColor = .white
        singleCollectionView.dataSource = self
        singleCollectionView.delegate = self
        singleCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        singleCollectionView.isPagingEnabled = true
        singleCollectionView.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(singleCollectionView)
        
        
        pc = UIPageControl()
        pc.frame = CGRect(x: 0, y: 45+150+4, width: 100, height: 20)
        pc.center.x = self.contentView.center.x
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = .darkGray
        pc.pageIndicatorTintColor = .lightGray
        self.contentView.addSubview(pc)
    }
    

    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}



extension PostCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.contentView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = "family"
        label.textAlignment = .center
        label.font = UIFont(name: "OpenSans-Light", size: 48)
        cell.contentView.addSubview(label)
        
        if indexPath.row == 0 {
            // gradient layer
            let gradient = CAGradientLayer()
            gradient.frame = cell.bounds
            let color2 = UIColor(red: 163.0/255.0, green: 10.0/255.0, blue: 111.0/255.0, alpha: 0.8)
            let color1 = UIColor(red: 253.0/255.0, green: 131.0/255.0, blue: 131.0/255.0, alpha: 0.8)
            gradient.colors = [color1.cgColor, color2.cgColor]
            gradient.shouldRasterize = true
            cell.layer.insertSublayer(gradient, at:0)
        } else if indexPath.row == 1 {
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
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pc.currentPage = Int(pageNumber)
    }
}


