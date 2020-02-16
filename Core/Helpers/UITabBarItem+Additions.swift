//
//  UITabBarItem+Additions.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

extension UITabBarItem {
    
    func tabBarWithNoTitle() -> UITabBarItem {
        self.imageInsets = UIEdgeInsets(top: 6, left: 0,bottom: -6, right: 0)
        self.titlePositionAdjustment = UIOffset(horizontal: 0,vertical: 100)
        return self
    }
}
