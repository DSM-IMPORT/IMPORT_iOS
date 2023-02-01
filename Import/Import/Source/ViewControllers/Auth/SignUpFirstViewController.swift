//
//  SignUpFirstViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/01.
//

import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class SignUpFirstViewController: BaseVC, Stepper {
    var steps = PublishRelay<Step>()
    
    var initialStep: Step {
        IMPORTStep.homeIsRequired
    }
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("하하하", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Signup"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func signupButtonDidTap() {
        self.steps.accept(IMPORTStep.homeIsRequired)
    }
}
