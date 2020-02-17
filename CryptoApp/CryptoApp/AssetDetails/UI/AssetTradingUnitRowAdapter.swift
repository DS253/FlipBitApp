//
//  AssetTradingUnitRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol AssetTradingUnitRowAdapterDelegate: class {
    func rowAdapterDidTapBuyButton(_ rowAdapter: AssetTradingUnitRowAdapter)
    func rowAdapterDidTapSellButton(_ rowAdapter: AssetTradingUnitRowAdapter)
}

class AssetTradingUnitRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    weak var delegate: AssetTradingUnitRowAdapterDelegate?
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if object is FinanceTradingModel, let cell = cell as? AssetTradingCollectionViewCell {
            
            cell.buyButton.configure(color: uiConfig.mainThemeBackgroundColor,
                                     font: uiConfig.boldFont(size: 16),
                                     cornerRadius: 6,
                                     borderColor: nil,
                                     backgroundColor: uiConfig.mainThemeForegroundColor,
                                     borderWidth: nil)
            cell.buyButton.setTitle("Buy", for: .normal)
            cell.buyButton.addTarget(self, action: #selector(didTapBuyButton), for: .touchUpInside)
            
            cell.sellButton.configure(color: uiConfig.mainThemeBackgroundColor,
                                      font: uiConfig.boldFont(size: 16),
                                      cornerRadius: 6,
                                      borderColor: nil,
                                      backgroundColor: uiConfig.mainThemeForegroundColor,
                                      borderWidth: nil)
            cell.sellButton.setTitle("Sell", for: .normal)
            cell.sellButton.addTarget(self, action: #selector(didTapSellButton), for: .touchUpInside)
            
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return AssetTradingCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is FinanceTradingModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
    
    @objc private func didTapSellButton() {
        self.delegate?.rowAdapterDidTapSellButton(self)
    }
    
    @objc private func didTapBuyButton() {
        self.delegate?.rowAdapterDidTapBuyButton(self)
    }
}
