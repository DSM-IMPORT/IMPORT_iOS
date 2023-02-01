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
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.view.backgroundColor = .systemBackground
    
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func loginButtonDidTap() {
        self.steps.accept(IMPORTStep.homeIsRequired)
    }
}
