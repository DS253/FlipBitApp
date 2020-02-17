//
//  TransactionsViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class TransactionsViewController: GenericCollectionViewController {
    let uiConfig: UIGenericConfigurationProtocol
    let dsProvider: FinanceDataSourceProvider
    
    init(transactionDataSource: GenericCollectionViewControllerDataSource,
         dsProvider: FinanceDataSourceProvider,
         scrollingEnabled: Bool,
         uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        
        let layout = ATCCollectionViewFlowLayout()
        let config = GenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                     pullToRefreshTintColor: .white,
                                                                     collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewLayout: layout,
                                                                     collectionPagingEnabled: false,
                                                                     hideScrollIndicators: true,
                                                                     hidesNavigationBar: false,
                                                                     headerNibName: nil,
                                                                     scrollEnabled: scrollingEnabled,
                                                                     uiConfig: uiConfig,
                                                                     emptyViewModel: nil)
        super.init(configuration: config)
        self.genericDataSource = transactionDataSource
        self.use(adapter: TransactionsRowAdapter(uiConfig: uiConfig), for: "FinanceTransaction")
        self.title = "Transactions"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
