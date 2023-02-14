//
//  FindIdViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit

class FindIdViewController: BaseSV {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    
    override func attribute() {
        view.backgroundColor = .White
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstTitle.text = "아이디를 찾아요"
        secondTitle.text = "전화번호 인증을 통해 시작해 보세요"
        firstTextField.placeholder = "전화번호를 입력해 주세요"
        secondTextField.placeholder = "전송된 인증번호를 입력해 주세요"
        
        
    }
}
