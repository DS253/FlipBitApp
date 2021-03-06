//
//  RoundImageRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class RoundImageRowAdapter: GenericCollectionRowAdapter, ProfileImageTapDelegate {
    weak var delegate: ProfileImageTapCollectionViewDelegate?
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ATCImage, let cell = cell as? ATCRoundImageCollectionViewCell else { return }
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.clipsToBounds = true
        cell.clipsToBounds = true
        
        if let url = viewModel.urlString {
            cell.imageView.kf.setImage(with: URL(string: url), placeholder: UIImage.localImage("empty-avatar"))
        } else {
            cell.imageView.image = viewModel.localImage
        }
        cell.imageView.layer.cornerRadius = 130.0 / 2.0
        cell.delegate = self
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCRoundImageCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let _ = object as? ATCImage else { return .zero }
        return CGSize(width: containerBounds.width, height: 170)
    }
    
    func profileImageDidTap(cell: ATCRoundImageCollectionViewCell) {
        delegate?.profileImageDidTap(cell: cell)
    }
}
