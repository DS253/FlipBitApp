//
//  CryptoViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class CryptoViewController: GenericCollectionViewController {
    var uiConfig: UIGenericConfigurationProtocol
    let dsProvider: FinanceDataSourceProvider
    
    init(uiConfig: UIGenericConfigurationProtocol,
         dsProvider: FinanceDataSourceProvider,
         dataSource: GenericCollectionViewControllerDataSource) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        let layout = ATCCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
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
        self.genericDataSource = dataSource
        self.use(adapter: FinanceAssetRowAdapter(uiConfig: uiConfig), for: "FinanceAsset")
        
        self.selectionBlock = {[weak self] (navController, object, indexPath) in
            guard let strongSelf = self else { return }
            if let stock = object as? FinanceAsset {
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
