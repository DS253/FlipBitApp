//
//  AddBankAccountButtonRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol AddBankAccountButtonRowAdapterDelegate: class {
    func rowAdapterDidTapButton(_ rowAdapter: AddBankAccountButtonRowAdapter)
}

class AddBankAccountButtonRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    weak var delegate: AddBankAccountButtonRowAdapterDelegate?
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let _ = object as? AddBankAccountModel, let cell = cell as? AddBankAccountCollectionViewCell {
            cell.button.setTitle("Link Another Institution", for: .normal)
            cell.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            cell.button.configure(color: uiConfig.mainThemeBackgroundColor,
                                  font: uiConfig.regularFont(size: 16),
                                  cornerRadius: 10,
                                  borderColor: nil,
                                  backgroundColor: uiConfig.mainThemeForegroundColor,
                                  borderWidth: 0)
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return AddBankAccountCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is AddBankAccountModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 80)
    }
    
    @objc private func didTapButton() {
        self.delegate?.rowAdapterDidTapButton(self)
    }
}
