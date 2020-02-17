//
//  FinanceNotificationsViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceNotificationsViewController: GenericCollectionViewController {
    var uiConfig: UIGenericConfigurationProtocol
    var dsProvider: FinanceDataSourceProvider
    
    init(dsProvider: FinanceDataSourceProvider, uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        
        let layout = LiquidCollectionViewLayout()
        let config = GenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                     pullToRefreshTintColor: .white,
                                                                     collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewLayout: layout,
                                                                     collectionPagingEnabled: false,
                                                                     hideScrollIndicators: true,
                                                                     hidesNavigationBar: false,
                                                                     headerNibName: nil,
                                                                     scrollEnabled: true,
                                                                     uiConfig: uiConfig,
                                                                     emptyViewModel: nil)
        super.init(configuration: config)
        self.genericDataSource = dsProvider.notificationsDataSource()
        self.use(adapter: FinanceNotificationRowAdapter(uiConfig: uiConfig), for: "NotificationModel")
        
        self.selectionBlock = {[weak self] (navController, object, indexPath) in
            guard self != nil else { return }
            if object is NotificationModel {
            }
        }
        self.title = "Notifications"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
