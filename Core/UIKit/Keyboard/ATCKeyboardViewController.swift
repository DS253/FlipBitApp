//
//  ATCKeyboardViewController.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/27/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

protocol ATCKeyboardViewControllerDelegate: class {
    func keyboardViewController(_ vc: ATCKeyboardViewController, didTap key: KeyboardKey)
}

class ATCKeyboardViewController: ATCGenericCollectionViewController {
    let uiConfig: UIGenericConfigurationProtocol
    let keys: [KeyboardKey]

    weak var delegate: ATCKeyboardViewControllerDelegate?
    
    init(keys: [KeyboardKey],
         uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.keys = keys

        let layout = LiquidCollectionViewLayout()
        let config = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
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
        self.use(adapter: ATCKeyboardKeyRowAdapter(uiConfig: uiConfig), for: "KeyboardKey")

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
