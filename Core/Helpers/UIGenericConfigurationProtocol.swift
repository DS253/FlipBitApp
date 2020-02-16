//
//  UIGenericConfigurationProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol UIGenericConfigurationProtocol {
    var mainThemeBackgroundColor: UIColor { get }
    var mainThemeForegroundColor: UIColor { get }
    var mainTextColor: UIColor { get }
    var mainSubtextColor: UIColor {  get}
    var hairlineColor: UIColor { get }
    var colorGray0: UIColor { get }
    var colorGray3: UIColor { get }
    var colorGray9: UIColor { get }
    
    var statusBarStyle: UIStatusBarStyle { get }
    
    var regularSmallFont: UIFont { get }
    var regularMediumFont: UIFont { get }
    var regularLargeFont: UIFont { get }
    var mediumBoldFont: UIFont { get }
    
    var boldSmallFont: UIFont { get }
    var boldLargeFont: UIFont { get }
    var boldSuperLargeFont: UIFont { get }
    
    var italicMediumFont: UIFont { get }
    
    func regularFont(size: CGFloat) -> UIFont
    func boldFont(size: CGFloat) -> UIFont
    
    func configureUI()
}
