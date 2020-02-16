//
//  TransactionsViewController.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/20/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class TransactionsViewController: ATCGenericCollectionViewController {
    let uiConfig: UIGenericConfigurationProtocol
    let dsProvider: FinanceDataSourceProvider

    init(transactionDataSource: ATCGenericCollectionViewControllerDataSource,
         dsProvider: FinanceDataSourceProvider,
         scrollingEnabled: Bool,
         uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider

        let layout = ATCCollectionViewFlowLayout()
        let config = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
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
