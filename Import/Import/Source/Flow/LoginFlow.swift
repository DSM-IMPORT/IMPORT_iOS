//
//  LoginFlow.swift
//  Import
//
//  Created by 박준하 on 2023/01/31.
//

import UIKit
import RxFlow
import Then

class LoginFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
//    private lazy var rootViewController = UINavigationController().then { viewController in
//        return viewController
//    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AuthStep else { return .none }
        switch step {
        case .loginIsRequired:
            return navigateToLogin()
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: AuthStep.homeIsRequired)
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let viewController = EmailLoginViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
