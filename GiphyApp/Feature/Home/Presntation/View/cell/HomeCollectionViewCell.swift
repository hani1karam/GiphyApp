//
//  HomeCollectionViewCell.swift
//  NetworkManager
//
//  Created by hany karam on 2/21/22.
//

import UIKit
import Kingfisher
class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeView.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.5))
        homeView.layer.cornerRadius = 10.0
        img.layer.cornerRadius = 10.0
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
    func reloadImage(image: Datum) {
        img.kf.indicatorType = .activity
        if let img = URL(string: image.images?.downsized?.url ?? ""){
            DispatchQueue.main.async {
                self.img.kf.setImage(with: img)
            }
        }
        
    }
    
}
