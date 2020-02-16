//
//  CryptoPreviewViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class CryptoPreviewViewController: ATCGenericCollectionViewController {
    var uiConfig: UIGenericConfigurationProtocol
    var dsProvider: FinanceDataSourceProvider
    
    init(dsProvider: FinanceDataSourceProvider,
         uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        
        let layout = ATCCollectionViewFlowLayout()
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
        self.genericDataSource = dsProvider.cryptoHomeDataSource
        self.use(adapter: CardHeaderRowAdapter(uiConfig: uiConfig), for: "CardHeaderModel")
        self.use(adapter: CardFooterRowAdapter(uiConfig: uiConfig), for: "CardFooterModel")
        self.use(adapter: FinanceAssetRowAdapter(uiConfig: uiConfig), for: "FinanceAsset")
        
        self.selectionBlock = {[weak self] (navController, object, indexPath) in
            guard let strongSelf = self else { return }
            if object is CardFooterModel {
                let vc = CryptoHomeViewController(uiConfig: strongSelf.uiConfig, dsProvider: strongSelf.dsProvider)
                strongSelf.navigationController?.pushViewController(vc, animated: true)
            } else if let stock = object as? FinanceAsset {
                let vc = AssetDetailsViewController(asset: stock,
                                                    user: strongSelf.dsProvider.user,
                                                    uiConfig: strongSelf.uiConfig,
                                                    dsProvider: strongSelf.dsProvider)
                strongSelf.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
