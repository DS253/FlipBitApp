//
//  NewsViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class NewsViewController: GenericCollectionViewController {
    var uiConfig: UIGenericConfigurationProtocol
    var dsProvider: FinanceDataSourceProvider
    
    init(dsProvider: FinanceDataSourceProvider, uiConfig: UIGenericConfigurationProtocol) {
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
                                                                     scrollEnabled: true,
                                                                     uiConfig: uiConfig,
                                                                     emptyViewModel: nil)
        super.init(configuration: config)
        self.genericDataSource = dsProvider.allNewsDataSource
        self.use(adapter: FinanceNewsRowAdapter(uiConfig: uiConfig), for: "FinanceNewsModel")
        
        self.selectionBlock = {[weak self] (navController, object, indexPath) in
            guard let strongSelf = self else { return }
            if let news = object as? FinanceNewsModel {
                if let url = URL(string: news.url) {
                    let vc = WebViewController(url: url, title: news.publication)
                    strongSelf.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        self.title = "Crypto News"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
