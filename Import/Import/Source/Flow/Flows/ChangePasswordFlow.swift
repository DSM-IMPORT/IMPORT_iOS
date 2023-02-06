//
//  ChangePasswordFlow.swift
//  Import
//
//  Created by 박준하 on 2023/02/06.
//

import UIKit
import RxFlow
import Then

class ChangePasswordFlow: Flow {
    var  root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? IMPORTStep else { return .none }
        switch step {
            
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.changePasswordRequired)
        case .homeIsRequired:
            return .none
        case .signupIsRequired:
            return .none
        case .changePasswordRequired:
            return self.navigateToChangePassword()
        }
    }
    
    private func navigateToChangePassword() -> FlowContributors {
        let viewController = ChangePasswordViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        print("비밀번호 변경으로 이동")
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
