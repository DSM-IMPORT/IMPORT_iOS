//
//  SecessionSecondViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit
import SnapKit
import Then

class SecessionSecondViewController: BaseSV {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .White
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        lazy var textFields = [firstTextField]
        let placeholders = ["비밀번호를 입력해 주세요"]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
        
        firstTitle.text = "회원을 탈퇴해요"
        secondTitle.text = "비밀번호를 입력해 주세요"
        
        secondTextField.isUserInteractionEnabled = false
        secondTextField.placeholder = ""
        secondTextField.textColor = .systemBackground
        passwordLine.backgroundColor = .systemBackground
        
        loginFirstNextButton.rx.tap
            .bind {
                self.showPopUp(title: "회원 탈퇴하기",message: "정말 회원을 탈퇴하실 건가요?\n이 작업은 되돌릴 수 없어요",leftActionTitle: "되돌아가기", rightActionTitle: "탈퇴하기")
            }
    }
}

extension SecessionSecondViewController {
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField: animate(line: usernameLine)
        default: return
        }
    }
}
