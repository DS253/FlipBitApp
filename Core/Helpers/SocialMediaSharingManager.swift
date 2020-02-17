//
//  SocialMediaSharingManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Social
import UIKit

public protocol SocialMediaSharable {
    func image() -> UIImage?
    func url() -> URL?
    func text() -> String?
}

public class SocialMediaSharingManager {
    public static func shareOnFacebook(object: SocialMediaSharable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeFacebook, from: presentingVC)
    }
    
    public static func shareOnTwitter(object: SocialMediaSharable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeTwitter, from: presentingVC)
    }
    
    private static func share(object: SocialMediaSharable, for serviceType: String, from presentingVC: UIViewController) {
        if let composeVC = SLComposeViewController(forServiceType:serviceType) {
            composeVC.add(object.image())
            composeVC.add(object.url())
            composeVC.setInitialText(object.text())
            presentingVC.present(composeVC, animated: true, completion: nil)
        }
    }
}
