//
//  GenericSearchViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

typealias GenericSearchViewControllerCancelBlock = () -> Void

protocol GenericSearchable: class {
    func matches(keyword: String) -> Bool
}

struct GenericSearchViewControllerConfiguration {
    let searchBarPlaceholderText: String?
    let uiConfig: UIGenericConfigurationProtocol
    let cellPadding: CGFloat
}

protocol GenericSearchViewControllerDataSource: class {
    var viewer: ATCUser? { get set }
    var delegate: GenericSearchViewControllerDataSourceDelegate? { get set }
    func search(text: String?)
    func update(completion: @escaping () -> Void)
}

protocol GenericSearchViewControllerDataSourceDelegate: class {
    func dataSource(_ dataSource: GenericSearchViewControllerDataSource, didFetchResults results: [GenericBaseModel])
}

class GenericSearchViewController<T: GenericBaseModel>: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate, GenericSearchViewControllerDataSourceDelegate{
    
    let searchController: UISearchController
    let configuration: GenericSearchViewControllerConfiguration
    let searchResultsController: GenericCollectionViewController
    let localDataSource: GenericLocalDataSource<T>
    var cancelBlock: GenericSearchViewControllerCancelBlock?
    
    var searchDataSource: GenericSearchViewControllerDataSource? {
        didSet {
            searchDataSource?.delegate = self
        }
    }
    
    init(configuration: GenericSearchViewControllerConfiguration) {
        let config = GenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false,
                                                                     pullToRefreshTintColor: configuration.uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewBackgroundColor: configuration.uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewLayout: LiquidCollectionViewLayout(cellPadding: configuration.cellPadding),
                                                                     collectionPagingEnabled: false,
                                                                     hideScrollIndicators: true,
                                                                     hidesNavigationBar: false,
                                                                     headerNibName: nil,
                                                                     scrollEnabled: true,
                                                                     uiConfig: configuration.uiConfig,
                                                                     emptyViewModel: nil)
        localDataSource = GenericLocalDataSource<T>(items: [])
        searchResultsController = GenericCollectionViewController(configuration: config)
        searchResultsController.genericDataSource = localDataSource
        
        searchController = UISearchController(searchResultsController: searchResultsController)
        self.configuration = configuration
        
        super.init(nibName: nil, bundle: nil)
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.placeholder = configuration.searchBarPlaceholderText
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.delegate = self
        searchController.view.backgroundColor = configuration.uiConfig.mainThemeBackgroundColor
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        searchDataSource?.search(text: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.searchController.searchBar.becomeFirstResponder()
        self.searchController.isActive = true
    }
    
    func use(adapter: GenericCollectionRowAdapter, for classString: String) {
        searchResultsController.use(adapter: adapter, for: classString)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchDataSource?.search(text: searchController.searchBar.text)
    }
    
    func dataSource(_ dataSource: GenericSearchViewControllerDataSource, didFetchResults results: [GenericBaseModel]) {
        if let res = results as? [T] {
            localDataSource.update(items: res)
        }
    }
    
    // MARK: - UISearchBarDelegate
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let cancelBlock = cancelBlock {
            cancelBlock()
        }
    }
}

class ATCGenericLocalSearchDataSource: GenericSearchViewControllerDataSource {
    
    var viewer: ATCUser? = nil
    let items: [GenericBaseModel]
    weak var delegate: GenericSearchViewControllerDataSourceDelegate?
    
    init(items: [GenericBaseModel]) {
        self.items = items
    }
    
    func search(text: String?) {
        delegate?.dataSource(self, didFetchResults: items.shuffled())
    }
    
    func update(completion: @escaping () -> Void) {}
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
