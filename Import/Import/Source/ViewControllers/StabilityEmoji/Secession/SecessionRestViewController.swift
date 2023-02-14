//
//  SecessionRestViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit
import SnapKit
import Then

class SecessionRestViewController: BaseRest {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        GoodImage.image = UIImage(named: "")
        GoodImage.backgroundColor = .Gray300
        
        firstTitle.text = "탈퇴했어요"
        secondTitle.text = "Import를 탈퇴했어요\n다음에 다시 만나요!"
    }
    
}
