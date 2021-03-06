//
//  PortfolioPieChartRow.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Charts
import UIKit

class PortfolioPieChartRowAdapter: GenericCollectionRowAdapter, ChartViewDelegate {
    let uiConfig: UIGenericConfigurationProtocol
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let pieChart = object as? PieChart,
            let cell = cell as? ATCPieChartCollectionViewCell,
            let chartView = cell.pieChartView {
            
            let dataSet = PieChartDataSet(entries: pieChart.entries, label: pieChart.name)
            let data = PieChartData(dataSet: dataSet)
            chartView.data = data
            
            dataSet.colors = [NSUIColor(hexString: "#ff8711"),
                              NSUIColor(hexString: "#9ed764"),
                              NSUIColor(hexString: "#ffd38d"),
                              NSUIColor(hexString: "#229ff6"),
                              NSUIColor(hexString: "#dba0d5"),
                              NSUIColor(hexString: "#ff8e9c"),
            ]
            dataSet.valueFormatter = MyFormatter(format: pieChart.format)
            
            chartView.backgroundColor = uiConfig.mainThemeBackgroundColor
            chartView.drawHoleEnabled = true
            chartView.legend.textColor = uiConfig.mainTextColor
            chartView.legend.direction = .leftToRight
            chartView.legend.font = uiConfig.regularMediumFont
            chartView.legend.textColor = uiConfig.mainThemeForegroundColor
            chartView.legend.enabled = true
            
            chartView.legend.xOffset = 18
            
            chartView.setExtraOffsets(left: -30, top: -10, right: -10, bottom: -15)
            chartView.notifyDataSetChanged()
            cell.setNeedsLayout()
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCPieChartCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is PieChart else { return .zero }
        return CGSize(width: containerBounds.width, height: 350)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("Asda")
    }
}
