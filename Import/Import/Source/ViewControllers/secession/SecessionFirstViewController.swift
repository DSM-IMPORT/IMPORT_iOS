//
//  SecessionFirstViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit

class SecessionFirstViewController: BaseSV {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .White
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstTitle.text = "회원을 탈퇴해요"
        secondTitle.text = "전화번호 인증으로 계속하세요"
        
        firstTextField.placeholder = "전화번호를 입력해 주세요"
        secondTextField.placeholder = "전송된 인증번호를 입력해 주세요"
    }
}
