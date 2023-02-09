//
//  SignUpSecondViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class SignUpSecondViewController: BaseSV {
    
    internal lazy var thirdTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .Black
    }
    
    internal lazy var thirdLine = UIView().then {
        $0.backgroundColor = .Gray400
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        controller.view.addSubview(thirdTextField)
        controller.view.addSubview(thirdLine)
        
        lazy var textFields = [firstTextField, secondTextField, thirdTextField]
        let placeholders = ["실명을 입력해 주세요", "아이디를 입력해 주세요", "이메일을 입력해 주세요"]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
        
        thirdTextField.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom).offset(16.0)
            $0.centerX.equalTo(firstTextField.snp.centerX)
            $0.width.equalTo(firstTextField.snp.width)
            $0.height.equalTo(firstTextField.snp.height)
        }
        
        thirdLine.snp.makeConstraints {
            $0.top.equalTo(thirdTextField.snp.bottom)
            $0.leading.equalTo(thirdTextField.snp.leading)
            $0.height.equalTo(2.0)
            $0.width.equalTo(382)
        }
        
        loginFirstNextButton.snp.makeConstraints {
            $0.height.equalTo(48.0)
            $0.width.equalTo(398.0)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(thirdLine.snp.bottom).offset(345)
        }
        
        firstTitle.text = "새로운 계정으로 시작해요"
        secondTitle.text = "정보를 입력하여 시작해 보세요"
        
    }
    
    override func attribute() {
        self.view.backgroundColor = .systemBackground
    }
    
    func signupButtonDidTap() {
        self.steps.accept(IMPORTStep.homeIsRequired)
    }
}

extension SignUpSecondViewController {
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField: animate(line: usernameLine)
        case secondTextField: animate(line: passwordLine)
        case thirdTextField: animate(line: thirdLine)
        default: return
        }
    }
}
