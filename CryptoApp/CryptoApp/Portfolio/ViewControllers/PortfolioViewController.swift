//
//  PortfolioViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class PortfolioViewController: GenericCollectionViewController {
    let uiConfig: UIGenericConfigurationProtocol
    let dsProvider: FinanceDataSourceProvider
    
    init(uiConfig: UIGenericConfigurationProtocol,
         dsProvider: FinanceDataSourceProvider) {
        self.uiConfig = uiConfig
        self.dsProvider = dsProvider
        let layout = LiquidCollectionViewLayout(cellPadding: 10)
        let homeConfig = GenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
                                                                         pullToRefreshTintColor: .white,
                                                                         collectionViewBackgroundColor: UIColor(hexString: "#f4f6f9"),
                                                                         collectionViewLayout: layout,
                                                                         collectionPagingEnabled: false,
                                                                         hideScrollIndicators: true,
                                                                         hidesNavigationBar: false,
                                                                         headerNibName: nil,
                                                                         scrollEnabled: true,
                                                                         uiConfig: uiConfig,
                                                                         emptyViewModel: nil)
        super.init(configuration: homeConfig)
        
        // Configuring the Chart
        let chartViewModel = FinanceStaticDataProvider.porfolioChart
        
        // Configuring the Crypto Card
        let cryptosVC = CryptoPreviewViewController(dsProvider: dsProvider, uiConfig: uiConfig)
        let cryptosVCModel = ViewControllerContainerViewModel(viewController: cryptosVC,
                                                                 subcellHeight: 75)
        cryptosVCModel.parentViewController = self
        
        // Configuring the News Card
        let newsVC = NewsPreviewStoriesViewController(dsProvider: dsProvider, uiConfig: uiConfig)
        let newsVCModel = ViewControllerContainerViewModel(viewController: newsVC,
                                                              subcellHeight: 100)
        newsVCModel.parentViewController = self
        
        self.genericDataSource = GenericLocalHeteroDataSource(items: [chartViewModel,
                                                                      cryptosVCModel,
                                                                      newsVCModel
        ])
        self.use(adapter: CardViewControllerContainerRowAdapter(), for: "ViewControllerContainerViewModel")
        self.use(adapter: PortfolioPieChartRowAdapter(uiConfig: uiConfig), for: "PieChart")
        //        self.use(adapter: ATCDividerRowAdapter(titleFont: uiConfig.regularFont(size: 16), minHeight: 30), for: "Divider")
        
        self.title = "Portfolio"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
