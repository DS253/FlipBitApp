//
//  WatchListViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class WatchlistViewController: GenericCollectionViewController {
    var uiConfig: UIGenericConfigurationProtocol
    var dsProvider: FinanceDataSourceProvider
    
    init(uiConfig: UIGenericConfigurationProtocol,
         dsProvider: FinanceDataSourceProvider) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        
        let layout = ATCCollectionViewFlowLayout()
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
        
        // Fetching the watchlist from disk and setting it up as data source for the view contorller
        let store = ATCDiskPersistenceStore(key: "asset_watchlist")
        if let assets = store.retrieve() as? [FinanceAsset] {
            self.genericDataSource = GenericLocalDataSource(items: assets)
        } else {
            self.genericDataSource = GenericLocalHeteroDataSource(items: [])
        }
        
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
        self.title = "Your Watchlist"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
