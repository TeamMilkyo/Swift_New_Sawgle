//
//  NewRegisterViewController.swift
//  Sawgle
//
//  Created by Edward Ahn on 5/20/19.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class NewRegisterViewController: UIViewController {
    @IBOutlet var idCheckCircle: UIImageView!
    @IBOutlet var passwordCheckCircle: UIImageView!
    @IBOutlet var passwordMatchCheckCIrcle: UIImageView!
    @IBOutlet var nameCheckCircle: UIImageView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var matchPasswordTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthDayLabel: UILabel!
    @IBOutlet var idCheckLabel: UILabel!
    @IBOutlet var passwordCheckLabel: UILabel!
    @IBOutlet var matchPasswordLabel: UILabel!
    @IBOutlet var registerButton: UIButton!

    func makeLabelFontSize() {
        if let targetView = view.viewWithTag(999) {
            let height = targetView.bounds.height
            let birthDayFont = UIFont(name: "S-CoreDream-4Regular", size: height * 0.2)
            birthDayLabel.font = birthDayFont
        }

        if let targetView = view.viewWithTag(998) {
            let height = targetView.bounds.height
            let checkLabelFont = UIFont(name: "S-CoreDream-4Regular", size: height * 0.7)
            idCheckLabel.font = checkLabelFont
            self.idCheckLabel.adjustsFontSizeToFitWidth = true
            self.passwordCheckLabel.font = checkLabelFont
            self.matchPasswordLabel.font = checkLabelFont
        }
    }

    @objc func textFieldDidChange(_ sender: UITextField) {
        if let inputText = sender.text {
            if inputText.isHangul() {
                self.idCheckLabel.text = "사용할 수 없는 문자열이 포함되어 있습니다."
                self.idCheckCircle.backgroundColor = .red
            } else {
                let removeSpace = inputText.trimmingCharacters(in: .whitespaces)

                if removeSpace != "" {
                    self.idCheckLabel.text = "사용할 수 있는 아이디 입니다."
                    self.idCheckCircle.backgroundColor = .green
                } else {
                    self.idCheckLabel.text = ""
                    self.idCheckCircle.backgroundColor = nil
                }
            }
        }
    }

    @IBAction func goBackView(_: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func moveBirthDayView(_: Any) {
        guard let birthVC = self.storyboard?.instantiateViewController(withIdentifier: "birthDayVC") else {
            return
        }

        birthVC.modalPresentationStyle = .overCurrentContext
        self.present(birthVC, animated: true)
    }

    override func viewDidLayoutSubviews() {
        let height = self.idCheckCircle.bounds.height
        self.idCheckCircle.layer.cornerRadius = height * 0.5
        self.passwordCheckCircle.layer.cornerRadius = height * 0.5
        self.passwordMatchCheckCIrcle.layer.cornerRadius = height * 0.5
        self.nameCheckCircle.layer.cornerRadius = height * 0.5
        self.makeLabelFontSize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
        self.matchPasswordTextField.delegate = self
        self.nameTextField.delegate = self

        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
}

extension NewRegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

extension String {
    func isHangul() -> Bool {
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9]*$")
        let results = regex?.matches(in: self,
                                     range: NSRange(self.startIndex..., in: self))

        if results?.count == 0 {
            return true
        }

        return false
    }
}
