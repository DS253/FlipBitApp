//
//  UIImage+Additions.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

extension UIImage {
    static func localImage(_ name: String, template: Bool = false) -> UIImage {
        var image = UIImage(named: name)!
        if template { image = image.withRenderingMode(.alwaysTemplate) }
        return image
    }
}
