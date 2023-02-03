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
//        button.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func attribute() {
        self.view.backgroundColor = .systemBackground
    }
    
    override func touchEvent() {
        button.rx.tap
            .bind {
                self.signupButtonDidTap()
            }
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
    }
    
    func signupButtonDidTap() {
        self.steps.accept(IMPORTStep.homeIsRequired)
    }
}
