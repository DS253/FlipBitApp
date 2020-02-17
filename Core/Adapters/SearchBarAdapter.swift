//
//  SearchBarAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol SearchBarAdapterDelegate: class {
    func searchAdapterDidFocus(_ adapter: SearchBarAdapter)
}

class SearchBarAdapter: NSObject, GenericCollectionRowAdapter, UISearchBarDelegate {
    let uiConfig: UIGenericConfigurationProtocol
    weak var delegate: SearchBarAdapterDelegate?
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? SearchBar, let cell = cell as? ATCSearchBarCollectionViewCell else { return }
        cell.searchBar.backgroundColor = .clear
        cell.searchBar.tintColor = UIColor.darkModeColor(hexString: "#8e8d93")
        cell.searchBar.searchBarStyle = .minimal
        cell.searchBar.backgroundImage = nil
        
        cell.searchBar.placeholder = viewModel.placeholder
        cell.searchBar.delegate = self
        
        cell.containerView.backgroundColor = .clear
        cell.setNeedsLayout()
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCSearchBarCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is SearchBar else { return .zero }
        return CGSize(width: containerBounds.width, height: 50)
    }
    
    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.delegate?.searchAdapterDidFocus(self)
    }
}
