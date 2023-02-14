import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class SignUpFirstViewController: BaseSV {
    
    var initialStep: Step {
        IMPORTStep.homeIsRequired
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstTitle.text = "새로운 계정으로 시작해요"
        secondTitle.text = "전화번호 인증을 통해 시작해 보세요"
        
        firstTextField.placeholder = "전화번호를 입력해 주세요"
        secondTextField.placeholder = "전송된 인증번호를 입력해 주세요"
        
        loginFirstNextButton.rx.tap
            .bind {
                self.navigationController?.pushViewController(SignUpSecondViewController(), animated: true)

            }
        
    }
    
    override func attribute() {
        self.view.backgroundColor = .systemBackground
    }
    
    func signupButtonDidTap() {
//        self.steps.accept(IMPORTStep.homeIsRequired)
    }
}
