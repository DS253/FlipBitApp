//
//  ViewControllerFactory.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    static func storiesViewController(dataSource: ATCGenericCollectionViewControllerDataSource,
                                      uiConfig: UIGenericConfigurationProtocol,
                                      minimumInteritemSpacing: CGFloat = 0,
                                      selectionBlock: ATCollectionViewSelectionBlock?) -> ATCGenericCollectionViewController {
        let layout = ATCCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumInteritemSpacing
        let configuration = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
                                                                            pullToRefreshTintColor: uiConfig.mainThemeBackgroundColor,
                                                                            collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                            collectionViewLayout: layout,
                                                                            collectionPagingEnabled: false,
                                                                            hideScrollIndicators: true,
                                                                            hidesNavigationBar: false,
                                                                            headerNibName: nil,
                                                                            scrollEnabled: true,
                                                                            uiConfig: uiConfig,
                                                                            emptyViewModel: nil)
        let vc = ATCGenericCollectionViewController(configuration: configuration, selectionBlock: selectionBlock)
        // vc.genericDataSource = ATCGenericLocalDataSource<ATCStoryViewModel>(items: stories)
        vc.genericDataSource = dataSource
        
        return vc
    }
    
    //    static func createContactUsViewController(viewModel: ATCContactUsViewModel, uiTheme: ATCContactUsUITheme) -> UIViewController {
    //        return ATCContactUsViewController(viewModel: viewModel, uiTheme: uiTheme, nibName: "ATCContactUsView", bundle: nil)
    //    }
}
