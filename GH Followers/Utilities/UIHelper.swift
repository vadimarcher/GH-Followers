//
//  UIHelper.swift
//  GH Followers
//
//  Created by Vadim Archer on 30.08.2022.
//

import UIKit

struct UIHelper {

   static func createThreeColumnFlowLayour(in view: UIView)-> UICollectionViewFlowLayout {
          
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
       return flowLayout
    }
    
}
