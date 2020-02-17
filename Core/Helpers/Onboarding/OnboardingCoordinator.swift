//
//  OnboardingCoordinator.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol OnboardingCoordinatorDelegate: class {
    func coordinatorDidCompleteOnboarding(_ coordinator: OnboardingCoordinatorProtocol, user: ATCUser?)
    func coordinatorDidResyncCredentials(_ coordinator: OnboardingCoordinatorProtocol, user: ATCUser?)
}

protocol OnboardingCoordinatorProtocol: LandingScreenManagerDelegate {
    func viewController() -> UIViewController
    var delegate: OnboardingCoordinatorDelegate? { get set }
    func resyncPersistentCredentials(user: ATCUser) -> Void
}

class OnboardingCoordinator: OnboardingCoordinatorProtocol, LoginScreenManagerDelegate, SignUpScreenManagerDelegate {
    weak var delegate: OnboardingCoordinatorDelegate?

    let landingManager: LandingScreenManager
    let landingScreen: ATCClassicLandingScreenViewController

    let loginManager: LoginScreenManager
    let loginScreen: ATCClassicLoginScreenViewController

    let signUpManager: SignUpScreenManager
    let signUpScreen: ATCClassicSignUpViewController

    let navigationController: UINavigationController

    let serverConfig: OnboardingServerConfigurationProtocol
    let firebaseLoginManager: ATCFirebaseLoginManager?

    init(landingViewModel: LandingScreenViewModel,
         loginViewModel: LoginScreenViewModel,
         signUpViewModel: SignUpScreenViewModel,
         uiConfig: OnboardingConfigurationProtocol,
         serverConfig: OnboardingServerConfigurationProtocol,
         userManager: SocialUserManagerProtocol?) {
        self.serverConfig = serverConfig
        self.firebaseLoginManager = serverConfig.isFirebaseAuthEnabled ? ATCFirebaseLoginManager() : nil
        self.landingScreen = ATCClassicLandingScreenViewController(uiConfig: uiConfig)
        self.landingManager = LandingScreenManager(landingScreen: self.landingScreen, viewModel: landingViewModel, uiConfig: uiConfig)
        self.landingScreen.delegate = landingManager

        self.loginScreen = ATCClassicLoginScreenViewController(uiConfig: uiConfig)
        self.loginManager = LoginScreenManager(loginScreen: self.loginScreen,
                                                  viewModel: loginViewModel,
                                                  uiConfig: uiConfig,
                                                  serverConfig: serverConfig,
                                                  userManager: userManager)
        self.loginScreen.delegate = loginManager

        self.signUpScreen = ATCClassicSignUpViewController(uiConfig: uiConfig)
        self.signUpManager = SignUpScreenManager(signUpScreen: self.signUpScreen, viewModel: signUpViewModel, uiConfig: uiConfig, serverConfig: serverConfig)
        self.signUpScreen.delegate = signUpManager

        self.navigationController = UINavigationController(rootViewController: landingScreen)

        self.landingManager.delegate = self
        self.loginManager.delegate = self
        self.signUpManager.delegate = self
    }

    func viewController() -> UIViewController {
        return navigationController
    }

    func resyncPersistentCredentials(user: ATCUser) -> Void {
        if serverConfig.isFirebaseAuthEnabled {
            self.firebaseLoginManager?.resyncPersistentUser(user: user) {[weak self] (syncedUser) in
                guard let `self` = self else { return }
                self.delegate?.coordinatorDidResyncCredentials(self, user: syncedUser)
            }
        } else {
            self.delegate?.coordinatorDidResyncCredentials(self, user: user)
        }
    }

    func landingScreenManagerDidTapLogIn(manager: LandingScreenManager) {
        self.navigationController.pushViewController(self.loginScreen, animated: true)
    }

    func landingScreenManagerDidTapSignUp(manager: LandingScreenManager) {
        self.navigationController.pushViewController(self.signUpScreen, animated: true)
    }

    func loginManagerDidCompleteLogin(_ loginManager: LoginScreenManager, user: ATCUser?) {
        self.delegate?.coordinatorDidCompleteOnboarding(self, user: user)
    }

    func signUpManagerDidCompleteSignUp(_ signUpManager: SignUpScreenManager, user: ATCUser?) {
        self.delegate?.coordinatorDidCompleteOnboarding(self, user: user)
    }
}

