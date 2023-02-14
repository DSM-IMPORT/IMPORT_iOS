//
//  FindIdRestViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit
import SnapKit
import Then

class FindIdRestViewController: BaseRest {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstTitle.text = "나중에 찾은 이메일 여기 넣기"
        secondTitle.text = "인증한 전화번호에 등록된 아이디에요\n비밀번호를 입력하여 계속해 보세요!"
        
    }
}
