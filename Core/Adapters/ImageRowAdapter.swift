//
//  ImageRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol ImageRowAdapterDelegate: class {
    func imageRowAdapter(_ adapter: ImageRowAdapter, didLoad image: UIImage)
}

class ImageRowAdapter: GenericCollectionRowAdapter {
    
    let cellHeight: CGFloat?
    let cellWidth: CGFloat?
    let contentMode: UIView.ContentMode
    let cornerRadius: CGFloat?
    let size: ((CGRect) -> CGSize)?
    let tintColor: UIColor?
    let bgColor: UIColor?
    
    weak var delegate: ImageRowAdapterDelegate?
    
    init(cellHeight: CGFloat? = nil,
         cellWidth: CGFloat? = nil,
         contentMode: UIView.ContentMode = .scaleAspectFill,
         cornerRadius: CGFloat? = nil,
         size: ((CGRect) -> CGSize)? = nil,
         tintColor: UIColor? = nil,
         bgColor: UIColor? = nil) {
        self.cellHeight = cellHeight
        self.cellWidth = cellWidth
        self.contentMode = contentMode
        self.cornerRadius = cornerRadius
        self.size = size
        self.tintColor = tintColor
        self.bgColor = bgColor
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ATCImage, let cell = cell as? ATCImageCollectionViewCell else { return }
        cell.atcImageView.contentMode = contentMode
        cell.atcImageView.clipsToBounds = true
        cell.clipsToBounds = true
        
        if let url = viewModel.urlString {
            cell.atcImageView.kf.setImage(with: URL(string: url),
                                          placeholder: nil,
                                          options: nil,
                                          progressBlock: nil) {[weak self] result in
                                            guard let `self` = self else { return }
                                            switch result {
                                            case .success(let value):
                                                self.delegate?.imageRowAdapter(self, didLoad: value.image)
                                            case .failure( _): break
                                            }
                                            
            }
        } else {
            cell.atcImageView.image = viewModel.localImage
        }
        if let cornerRadius = cornerRadius {
            cell.atcImageView.layer.cornerRadius = cornerRadius
        }
        if viewModel.isActionable {
            cell.atcImageView.contentMode = .center
            cell.atcImageView.tintColor = tintColor
            cell.atcImageView.backgroundColor = bgColor
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCImageCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let _ = object as? ATCImage else { return .zero }
        if let size = size {
            return size(containerBounds)
        }
        var height = containerBounds.height
        if let cellHeight = cellHeight {
            height = cellHeight
        }
        var w = containerBounds.width
        if let cellW = cellWidth {
            w = cellW
        }
        return CGSize(width: w, height: height)
    }
}
