//
//  LineChartAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Charts
import UIKit

struct LineChartConfiguration {
    var circleHoleColor: UIColor
    var gradientStartColor: UIColor
    var gradientEndColor: UIColor
    var lineColor: UIColor
    var leftAxisColor: UIColor
    var backgroundColor: UIColor
    var descriptionFont: UIFont
    var descriptionColor: UIColor
}

class AbbreviatedAxisValueFormatter: IAxisValueFormatter {
    func stringForValue(_ value: Double,
                        axis: AxisBase?) -> String {
        return value.abbreviated()
    }
}

class ATCLineChartAdapter: GenericCollectionRowAdapter, ChartViewDelegate {
    let config: LineChartConfiguration
    
    init(config: LineChartConfiguration) {
        self.config = config
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let lineChart = object as? LineChart,
            let cell = cell as? ATCLineChartCollectionViewCell,
            let chartView = cell.lineChartView {
            //            cell.containerView.clipsToBounds = true
            //            cell.containerView.layer.cornerRadius = 10
            //            cell.containerView.dropShadow()
            chartView.data = lineChartData(chart: lineChart)
            chartView.backgroundColor = config.backgroundColor
            //            chartView.gridBackgroundColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1.0)
            //            chartView.drawGridBackgroundEnabled = true
            //            chartView.drawBordersEnabled = true
            
            chartView.chartDescription?.enabled = true
            
            chartView.pinchZoomEnabled = false
            chartView.dragEnabled = false
            chartView.setScaleEnabled(false)
            chartView.delegate = self
            chartView.legend.enabled = false
            chartView.xAxis.enabled = false
            chartView.rightAxis.enabled = false
            chartView.leftAxis.drawGridLinesEnabled = false
            chartView.leftAxis.labelTextColor = config.leftAxisColor
            chartView.leftAxis.axisLineColor = config.leftAxisColor
            chartView.leftAxis.valueFormatter = AbbreviatedAxisValueFormatter()
            
            cell.lineChartView.chartDescription?.text = lineChart.name
            cell.lineChartView.chartDescription?.font = config.descriptionFont
            cell.lineChartView.chartDescription?.textColor = config.descriptionColor
            cell.setNeedsLayout()
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCLineChartCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is LineChart else { return .zero }
        return CGSize(width: containerBounds.width, height: 150)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("Asda")
    }
    
    func lineChartData(chart: LineChart) -> LineChartData {
        var lineChartEntry = [ChartDataEntry]()
        for (index, number) in chart.numbers.enumerated() {
            let value = ChartDataEntry(x: Double(index), y: number)
            lineChartEntry.append(value)
        }
        let line1 = LineChartDataSet(entries: lineChartEntry, label: nil)
        line1.colors = [config.lineColor]
        line1.lineWidth = 3
        line1.drawValuesEnabled = false
        line1.mode = .cubicBezier
        line1.circleRadius = 7
        line1.circleHoleRadius = 4
        line1.circleColors = [NSUIColor.white]
        line1.circleHoleColor = config.circleHoleColor
        line1.drawFilledEnabled = true
        let colors: CFArray = [config.gradientStartColor.cgColor, config.gradientEndColor.cgColor] as CFArray
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: [1.0, 0.0])
        let fill = Fill(linearGradient: gradient!, angle: 90.0)
        
        line1.fill = fill
        let data = LineChartData()
        data.addDataSet(line1)
        return data
    }
}