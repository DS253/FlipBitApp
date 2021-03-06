//
//  FinanceHostViewController.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceHostViewController: UIViewController, UITabBarControllerDelegate {
    
    let uiConfig: FinanceUIConfiguration
    let serverConfig: OnboardingServerConfigurationProtocol
    
    let homeVC: CryptoHomeViewController
    let portfolioVC: PortfolioViewController
    let bankAccountsVC: BankAccountsViewController
    let newsVC: NewsViewController
    let notificationsVC: FinanceNotificationsViewController
    var profileVC: ATCProfileViewController?
    let dsProvider: FinanceDataSourceProviderProtocol
    
    init(uiConfig: FinanceUIConfiguration, serverConfig: OnboardingServerConfigurationProtocol, dsProvider: FinanceDataSourceProvider) {
        self.uiConfig = uiConfig
        self.serverConfig = serverConfig
        self.dsProvider = dsProvider
        
        self.homeVC = CryptoHomeViewController(uiConfig: uiConfig, dsProvider: dsProvider)
        self.portfolioVC = PortfolioViewController(uiConfig: uiConfig, dsProvider: dsProvider)
        self.bankAccountsVC = BankAccountsViewController(uiConfig: uiConfig, dsProvider: dsProvider)
        self.newsVC = NewsViewController(dsProvider: dsProvider, uiConfig: uiConfig)
        self.notificationsVC = FinanceNotificationsViewController(dsProvider: dsProvider, uiConfig: uiConfig)
        
        super.init(nibName: nil, bundle: nil)
        self.profileVC = self.profileViewController()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var hostController: HostViewController = { [unowned self] in
        guard let profileVC = profileVC else {
            fatalError()
        }
        let menuItems: [NavigationItem] = [
            NavigationItem(title: "Home",
                           viewController: homeVC,
                           image: uiConfig.homeImage,
                           type: .viewController,
                           leftTopViews: nil,
                           rightTopViews: nil),
            NavigationItem(title: "Portfolio",
                           viewController: portfolioVC,
                           image: uiConfig.portfolioImage,
                           type: .viewController),
            NavigationItem(title: "Accounts",
                           viewController: bankAccountsVC,
                           image: uiConfig.accountsImage,
                           type: .viewController),
            NavigationItem(title: "News",
                           viewController: newsVC,
                           image: uiConfig.newsImage,
                           type: .viewController),
            NavigationItem(title: "Notifications",
                           viewController: notificationsVC,
                           image: uiConfig.notificationsImage,
                           type: .viewController),
            NavigationItem(title: "Profile",
                           viewController: profileVC,
                           image: uiConfig.profileImage,
                           type: .viewController)
        ]
        let menuConfiguration = MenuConfiguration(user: nil,
                                                     cellClass: ATCCircledIconMenuCollectionViewCell.self,
                                                     headerHeight: 0,
                                                     items: menuItems,
                                                     uiConfig: MenuUIConfiguration(itemFont: uiConfig.regularMediumFont,
                                                                                      tintColor: uiConfig.mainTextColor,
                                                                                      itemHeight: 45.0,
                                                                                      backgroundColor: uiConfig.mainThemeBackgroundColor))
        
        let config = HostConfiguration(menuConfiguration: menuConfiguration,
                                       style: .tabBar,
                                       topNavigationRightViews: nil,
                                       titleView: nil,
                                       topNavigationLeftImage: UIImage.localImage("three-equal-lines-icon", template: true),
                                       topNavigationTintColor: uiConfig.mainThemeForegroundColor,
                                       statusBarStyle: uiConfig.statusBarStyle,
                                       uiConfig: uiConfig,
                                       pushNotificationsEnabled: true,
                                       locationUpdatesEnabled: false)
        let onboardingCoordinator = self.onboardingCoordinator(uiConfig: uiConfig, serverConfig: serverConfig)
        let walkthroughVC = self.walkthroughVC(uiConfig: uiConfig)
        let vc = HostViewController(configuration: config, onboardingCoordinator: onboardingCoordinator, walkthroughVC: walkthroughVC, profilePresenter: nil)
        vc.delegate = self
        return vc
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewControllerWithView(hostController)
        hostController.view.backgroundColor = uiConfig.mainThemeBackgroundColor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return uiConfig.statusBarStyle
    }
    
    fileprivate func onboardingCoordinator(uiConfig: FinanceUIConfiguration, serverConfig: OnboardingServerConfigurationProtocol) -> OnboardingCoordinatorProtocol {
        let landingViewModel = LandingScreenViewModel(imageIcon: "finance-app-icon-1",
                                                      title: "Welcome to Instacoin",
                                                      subtitle: "Exchange, trade and monitor cryptocurrencies.",
                                                      loginString: "Log In",
                                                      signUpString: "Sign Up")
        let loginViewModel = LoginScreenViewModel(contactPointField: "E-mail or phone number",
                                                  passwordField: "Password",
                                                  title: "Sign In",
                                                  loginString: "Log In",
                                                  facebookString: "Facebook Login",
                                                  separatorString: "OR")
        
        let signUpViewModel = SignUpScreenViewModel(nameField: "Full Name",
                                                    phoneField: "Phone Number",
                                                    emailField: "E-mail Address",
                                                    passwordField: "Password",
                                                    title: "Create new account",
                                                    signUpString: "Sign Up")
        let userManager: SocialUserManagerProtocol? = serverConfig.isFirebaseAuthEnabled ? SocialFirebaseUserManager() : nil
        return OnboardingCoordinator(landingViewModel: landingViewModel,
                                     loginViewModel: loginViewModel,
                                     signUpViewModel: signUpViewModel,
                                     uiConfig: FinanceOnboardingConfiguration(config: uiConfig),
                                     serverConfig: serverConfig,
                                     userManager: userManager)
    }
    
    fileprivate func walkthroughVC(uiConfig: FinanceUIConfiguration) -> ATCWalkthroughViewController {
        let viewControllers = FinanceStaticDataProvider.walkthroughs.map { ATCClassicWalkthroughViewController(model: $0, uiConfig: uiConfig, nibName: "ATCClassicWalkthroughViewController", bundle: nil) }
        return ATCWalkthroughViewController(nibName: "ATCWalkthroughViewController",
                                            bundle: nil,
                                            viewControllers: viewControllers,
                                            uiConfig: uiConfig)
    }
    
    fileprivate func profileViewController() -> ATCProfileViewController {
        let vc = ATCProfileViewController(items: self.selfProfileItems(),
                                          uiConfig: uiConfig,
                                          selectionBlock: {[weak self] (nav, model, index) in
                                            guard let `self` = self else { return }
                                            if let _ = model as? ProfileButtonItem {
                                                // Logout
                                                NotificationCenter.default.post(name: kLogoutNotificationName, object: nil)
                                            } else if let item = model as? ProfileItem {
                                                if item.title == "Settings", let user = self.dsProvider.user {
                                                    let settingsVC = SettingsViewController(user: user)
                                                    self.profileVC?.navigationController?.pushViewController(settingsVC, animated: true)
                                                } else if item.title == "Account Details", let user = self.dsProvider.user  {
                                                    let accountSettingsVC = FinanceAccountDetailsViewController(user: user, updater: self.dsProvider.profileUpdater)
                                                    self.profileVC?.navigationController?.pushViewController(accountSettingsVC, animated: true)
                                                } else {
                                                    let contactVC = FinanceContactUsViewController()
                                                    nav?.pushViewController(contactVC, animated: true)
                                                }
                                            }
            }
        )
        vc.title = "Profile"
        return vc
    }
    
    fileprivate func selfProfileItems() -> [GenericBaseModel] {
        var items: [GenericBaseModel] = []
        items.append(contentsOf: [ProfileItem(icon: UIImage.localImage("account-male-icon", template: true),
                                              title: "Account Details",
                                              type: .arrow,
                                              color: UIColor(hexString: "#6979F8")),
                                  ProfileItem(icon: UIImage.localImage("settings-menu-item", template: true),
                                              title: "Settings",
                                              type: .arrow,
                                              color: UIColor(hexString: "#3F3356")),
                                  ProfileItem(icon: UIImage.localImage("contact-call-icon", template: true),
                                              title: "Contact Us",
                                              type: .arrow,
                                              color: UIColor(hexString: "#64E790"))
        ]);
        return items
    }
}

extension FinanceHostViewController: HostViewControllerDelegate {
    func hostViewController(_ hostViewController: HostViewController, didLogin user: ATCUser) {
        self.dsProvider.user = user
        self.profileVC?.user = user
    }
    
    func hostViewController(_ hostViewController: HostViewController, didSync user: ATCUser) {
        self.dsProvider.user = user
        self.profileVC?.user = user
    }
}
