import UIKit
import RxFlow
import Then

class LoginFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? IMPORTStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return .none
        case .signupIsRequired:
            return .none
        case .changePasswordRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.changePasswordRequired)
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let viewController = EmailLoginViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        print("로그인으로 이동")
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
