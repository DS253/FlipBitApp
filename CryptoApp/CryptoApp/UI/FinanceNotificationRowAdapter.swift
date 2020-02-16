//
//  FinanceNotificationRowAdapter.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/24/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class FinanceNotificationRowAdapter: GenericCollectionRowAdapter {
    let uiConfig: UIGenericConfigurationProtocol

    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? NotificationModel, let cell = cell as? ATCNotificationCollectionViewCell else { return }
        cell.hairlineView.backgroundColor = uiConfig.hairlineColor

        cell.categoryLabel.text = viewModel.category
        cell.categoryLabel.textColor = UIColor(hexString: "#BCC8CE")
        cell.categoryLabel.font = uiConfig.boldFont(size: 12)

        cell.contentLabel.text = viewModel.content
        cell.contentLabel.textColor = uiConfig.mainTextColor
        cell.contentLabel.font = uiConfig.regularFont(size: 16)

        cell.timeLabel.text = TimeFormatHelper.timeAgoString(date: viewModel.createdAt)
        cell.timeLabel.textColor = UIColor(hexString: "#BCC8CE")
        cell.timeLabel.font = uiConfig.italicMediumFont

        cell.badgeView.isHidden = !viewModel.isNotSeen
        cell.badgeView.backgroundColor = uiConfig.mainThemeForegroundColor
        cell.badgeView.clipsToBounds = true
        cell.badgeView.layer.cornerRadius = 5

        cell.notificationImageView.tintColor = UIColor(hexString: "#96999B")
        cell.notificationImageView.image = UIImage.localImage(viewModel.icon, template: true)

        cell.setNeedsLayout()
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCNotificationCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? NotificationModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 120)
    }
}
