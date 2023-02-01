//
//  EmailLoginViewController.swift
//  Import
//
//  Created by 박준하 on 2023/01/31.
//

import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class EmailLoginViewController: BaseVC, Stepper {
    
    var steps = PublishRelay<Step>()
    
    var initialStep: Step {
        IMPORTStep.homeIsRequired
    }
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.Gray400,
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    private lazy var firstTitle = UILabel().then {
        $0.text = "기존의 계정으로 계속해요"
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .Black
    }
    
    private lazy var secondTitle = UILabel().then {
        $0.text = "계정 정보를 입력하여 시작해 보세요"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .Gray600
    }
    
    private lazy var firstTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .Black
    }
    
    private lazy var secondTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .Black
    }
    
    private lazy var usernameLine = UIView().then {
        $0.backgroundColor = .Gray400
    }
    private lazy var passwordLine = UIView().then {
        $0.backgroundColor = .Gray400
    }
    
    private lazy var loginFirstNextButton = UIButton().then {
        $0.setTitle("계속", for: .normal)
        $0.setTitleColor(UIColor.White, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .Primary
        $0.layer.cornerRadius = 8.0
    }
    
    private lazy var changePasswordButton = UIButton().then {
        $0.setTitle("비밀번호 바꾸기", for: .normal)
        $0.setTitleColor(UIColor.Gray600, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(self, action: #selector(changePasswordButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 8.0
    }
    
    override func attribute() {
        
        lazy var textFields = [firstTextField, secondTextField]
        let placeholders = ["이름을 입력해 주세요.", "비밀번호를 입력해 주세요."]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                  attributes: attributes)
            textField.delegate = self
            index += 1
        }
        self.view.backgroundColor = .White
    }
    
    override func layout() {
        [
            firstTitle,
            secondTitle,
            firstTextField,
            secondTextField,
            usernameLine,
            passwordLine,
            loginFirstNextButton,
            changePasswordButton
        ].forEach { view.addSubview($0) }
        
        let width = view.frame.width / 430.0
        let height = view.frame.height / 932.0
        
        firstTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60.0)
            $0.leading.equalToSuperview().inset(24.0)
        }
        
        secondTitle.snp.makeConstraints {
            $0.top.equalTo(firstTitle.snp.bottom).offset(10.0)
            $0.leading.equalTo(firstTitle.snp.leading)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(secondTitle.snp.bottom).offset(60.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(382.0 * width)
            $0.height.equalTo(46.0 * height)
        }
        
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(16.0)
            $0.centerX.equalTo(firstTextField.snp.centerX)
            $0.width.equalTo(firstTextField.snp.width)
            $0.height.equalTo(firstTextField.snp.height)
        }
        
        usernameLine.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom)
            $0.leading.equalTo(firstTextField.snp.leading)
            $0.height.equalTo(2.0)
            $0.width.equalTo(382)
        }
        
        passwordLine.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom)
            $0.leading.equalTo(secondTextField.snp.leading)
            $0.height.equalTo(2.0)
            $0.width.equalTo(382)
        }
        
        loginFirstNextButton.snp.makeConstraints {
            $0.height.equalTo(48.0)
            $0.width.equalTo(398.0)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordLine.snp.bottom).offset(405)
        }
        
        changePasswordButton.snp.makeConstraints {
            $0.height.equalTo(loginFirstNextButton.snp.height)
            $0.width.equalTo(loginFirstNextButton.snp.width)
            $0.centerX.equalTo(loginFirstNextButton.snp.centerX)
            $0.top.equalTo(loginFirstNextButton.snp.bottom)
            $0.bottom.equalToSuperview().inset(34.0)
        }
    }
    
    func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    @objc
    func changePasswordButtonDidTap() {
        self.steps.accept(IMPORTStep.homeIsRequired)
    }
    
    @objc
    func nextButtonDidTap() {
        print("계속 버튼 눌림 😀")
    }

}

extension EmailLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField: animate(line: usernameLine)
        case secondTextField: animate(line: passwordLine)
        default: return
        }
    }
}

