//
//  Extenstion + UIVIEW.swift
//  NetworkManager
//
//  Created by hany karam on 2/21/22.
//

import UIKit
extension UIView{
    func static_shadow(withOffset value:CGSize,color: CGColor){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 2
        self.layer.shadowOffset = value
        self.layer.shadowRadius = 3
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}
