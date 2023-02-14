import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class EmailLoginViewController: BaseSV {
    
    private lazy var changePasswordButton = UIButton().then {
        $0.setTitle("비밀번호 바꾸기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.layer.cornerRadius = 8.0
    }
    
    override func viewDidLoad() {
        updateWith(self)
    }
    
    override func attribute() {
        view.backgroundColor = .White
    }
    
    override func touchEvent() {
        changePasswordButton.rx.tap
            .bind {
                self.changePasswordButtonDidTap()
            }.disposed(by: disposeBag)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        controller.view.addSubview(changePasswordButton)
        
        changePasswordButton.snp.makeConstraints {
            $0.height.equalTo(loginFirstNextButton.snp.height)
            $0.width.equalTo(loginFirstNextButton.snp.width)
            $0.centerX.equalTo(loginFirstNextButton.snp.centerX)
            $0.top.equalTo(loginFirstNextButton.snp.bottom)
            $0.bottom.equalToSuperview().inset(34.0)
        }
        
//        loginFirstNextButton.rx.tap
//            .bind {
//                self.nextButtonDidTap()
//            }.disposed(by: disposeBag)
    }
    
    func changePasswordButtonDidTap() {
//        self.steps.accept(IMPORTStep.changePasswordRequired)
        self.navigationController?.pushViewController(ChangePasswordViewController(), animated: true)
        print("changePasswordButtonDidTap")
    }
    
    
    func nextButtonDidTap() {
        print("계속 버튼 눌림 😀")
    }
}

