import UIKit
import RxFlow
import Then

class SignupFlow: Flow {
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
            return .none
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.homeIsRequired)
        case .signupIsRequired:
            return navigateToSignup()
        case .changePasswordRequired:
            return .none
        }
    }
    
    private func navigateToSignup() -> FlowContributors {
        let viewController = SignUpFirstViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        print("회원가입으로 이동")
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
