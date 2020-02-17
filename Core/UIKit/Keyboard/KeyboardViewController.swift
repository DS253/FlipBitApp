//
//  KeyboardViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol KeyboardViewControllerDelegate: class {
    func keyboardViewController(_ vc: KeyboardViewController, didTap key: KeyboardKey)
}

class KeyboardViewController: GenericCollectionViewController {
    let uiConfig: UIGenericConfigurationProtocol
    let keys: [KeyboardKey]
    
    weak var delegate: KeyboardViewControllerDelegate?
    
    init(keys: [KeyboardKey],
         uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.keys = keys
        
        let layout = LiquidCollectionViewLayout()
        let config = GenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
                                                                  pullToRefreshTintColor: .white,
                                                                  collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                  collectionViewLayout: layout,
                                                                  collectionPagingEnabled: false,
                                                                  hideScrollIndicators: true,
                                                                  hidesNavigationBar: false,
                                                                  headerNibName: nil,
                                                                  scrollEnabled: false,
                                                                  uiConfig: uiConfig,
                                                                  emptyViewModel: nil)
        super.init(configuration: config)
        
        self.genericDataSource = GenericLocalDataSource(items: keys)
        self.use(adapter: KeyboardKeyRowAdapter(uiConfig: uiConfig), for: "KeyboardKey")
        
        self.selectionBlock = {[weak self] (navController, object, indexPath) in
            guard let strongSelf = self else { return }
            if let key = object as? KeyboardKey {
                strongSelf.delegate?.keyboardViewController(strongSelf, didTap: key)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
