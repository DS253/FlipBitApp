//
//  ATCClassicSignUpViewController.swift
//  DashboardApp
//
//  Created by Florian Marcu on 8/10/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCClassicSignUpViewController: UIViewController, SignUpScreenProtocol {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nameTextField: FlipBitTextField!
    @IBOutlet var phoneNumberTextField: FlipBitTextField!
    @IBOutlet var passwordTextField: FlipBitTextField!
    @IBOutlet var emailTextField: FlipBitTextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var textView: UITextView!

    weak var delegate: SignUpScreenDelegate?

    let uiConfig: OnboardingConfigurationProtocol

    init(uiConfig: OnboardingConfigurationProtocol) {
        self.uiConfig = uiConfig
        super.init(nibName: "ATCClassicSignUpViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.signUpScreenDidLoadView(self)
        let color = UIColor(hexString: "#282E4F")
        backButton.tintColor = color
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        self.hideKeyboardWhenTappedAround()

        let linkedText = "Terms of Use"
        let string = "By creating an account you agree with our " + linkedText + "."
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link,
                                      value: "https://www.instamobile.io/eula-instachatty/",
                                      range: NSRange(location: string.count - 1 - linkedText.count, length: linkedText.count))
        textView.attributedText = attributedString
        textView.delegate = self
        textView.textColor = .gray
        textView.textAlignment = .center
        textView.backgroundColor = uiConfig.backgroundColor
        self.view.backgroundColor = uiConfig.backgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ATCClassicSignUpViewController: UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        //UIApplication.shared.open(URL, options: [:])
        let webView = WebViewController(url: URL, title: "Terms of Use")
        self.navigationController?.pushViewController(webView, animated: true)
        return false
    }

    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if let url = URL(string: "") {
            UIApplication.shared.open(url, options: [:])
        }
        return false
    }
}
