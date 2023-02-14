//
//  ChangePasswordRestViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit
import SnapKit
import Then

class ChangePasswordRestViewController: BaseRest {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstTitle.text = "축하드립니다!"
        secondTitle.text = "비밀번호를 바꿨어요\n새로운 비밀번호로 로그인 해 주세요"
    }
}
