//
//  FinanceDataSourceProvider.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/16/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class FinanceDataSourceProvider: FinanceDataSourceProviderProtocol {
    let uiConfig: UIGenericConfigurationProtocol
    var user: ATCUser?

    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func fetchLineChart(for selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void {
        completion(FinanceStaticDataProvider.lineChart)
    }

    func fetchStockChart(for selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void {
        completion(FinanceStaticDataProvider.lineChart)
    }

    func fetchBankAccountChart(for account: FinanceAccount, selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void {
        completion(FinanceStaticDataProvider.lineChart)
    }

    func fetchCryptosChart(for selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void {
        completion(FinanceStaticDataProvider.lineChart)
    }

    func fetchAssetChart(for asset: FinanceAsset, selectedDate: ATCChartDate, completion: (_ chart: LineChart?) -> Void) -> Void {
        completion(FinanceStaticDataProvider.lineChart)
    }

    func fetchAssetDetails(for user: ATCUser?, asset: FinanceAsset, completion: (_ position: FinanceAssetPosition?, _ stats: FinanceAssetStats, _ news: [FinanceNewsModel]) -> Void) -> Void {
        completion(FinanceStaticDataProvider.assetPosition, FinanceStaticDataProvider.assetStats, FinanceStaticDataProvider.news)
    }

    var chartConfig: LineChartConfiguration {
        return LineChartConfiguration(circleHoleColor: uiConfig.mainThemeForegroundColor,
                                         gradientStartColor: UIColor(hexString: "#e9973d", alpha: 0.6),
                                         gradientEndColor: UIColor(hexString: "#e9973d", alpha: 0.6),
                                         lineColor: UIColor(hexString: "#e9973d"),
                                         leftAxisColor: uiConfig.mainSubtextColor,
                                         backgroundColor: uiConfig.mainThemeBackgroundColor,
                                         descriptionFont: uiConfig.regularLargeFont,
                                         descriptionColor: uiConfig.mainThemeForegroundColor)
    }

    var cryptoHomeDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            [CardHeaderModel(title: "Cryptocurrencies")] +
                FinanceStaticDataProvider.cryptos +
                [CardFooterModel(title: "View all cryptocurrencies")]
        )    }

    var newsHomeDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            [CardHeaderModel(title: "Top Crypto News")] +
                FinanceStaticDataProvider.news +
                [CardFooterModel(title: "View more news")]
        )
    }

    var portfolioCashDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            [CardHeaderModel(title: "Cash")] +
                FinanceStaticDataProvider.portfolioCashAccounts
        )
    }

    var bankAccountsDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            FinanceStaticDataProvider.bankAccounts + [AddBankAccountModel()]
        )
    }

    var allCryptosListDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            FinanceStaticDataProvider.cryptos
        )
    }

    var allNewsDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items:
            FinanceStaticDataProvider.news
        )
    }

    func notificationsDataSource() -> ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items: FinanceStaticDataProvider.notifications)
    }

    var profileUpdater: ProfileUpdaterProtocol {
        return ATCProfileFirebaseUpdater(usersTable: "users")
    }

    var cryptoSearchDataSource: ATCGenericSearchViewControllerDataSource {
        return ATCGenericLocalSearchDataSource(items: FinanceStaticDataProvider.cryptos)
    }

    var institutionsDataSource: ATCGenericCollectionViewControllerDataSource {
        return ATCGenericLocalHeteroDataSource(items: FinanceStaticDataProvider.institutions)
    }

    var tradingNumericKeys: [ATCKeyboardKey] {
        return FinanceStaticDataProvider.numericKeys
    }
}
