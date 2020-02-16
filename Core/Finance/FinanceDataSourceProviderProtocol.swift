//
//  FinanceDataSourceProviderProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol FinanceDataSourceProviderProtocol: class {
    var user: ATCUser? { get set }
    
    func fetchLineChart(for selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void
    func fetchCryptosChart(for selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void
    func fetchAssetChart(for asset: FinanceAsset, selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void
    func fetchAssetDetails(for user: ATCUser?, asset: FinanceAsset, completion: (_ position: FinanceAssetPosition?, _ stats: FinanceAssetStats, _ news: [FinanceNewsModel]) -> Void) -> Void
    func fetchBankAccountChart(for account: FinanceAccount, selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void
    
    var chartConfig: LineChartConfiguration { get }
    var profileUpdater: ProfileUpdaterProtocol { get }
}
