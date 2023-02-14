import UIKit
import Then
import SnapKit

class SignUpRestSixthViewController: BaseRest {
    
    private lazy var joinDeveloperButton = UIButton().then {
        $0.setTitle("개발자로 가입하기", for: .normal)
        $0.setTitleColor(UIColor.Gray600, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.layer.cornerRadius = 8.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        view.addSubview(joinDeveloperButton)
        
        joinDeveloperButton.snp.makeConstraints {
            $0.height.equalTo(nextButton.snp.height)
            $0.width.equalTo(nextButton.snp.width)
            $0.centerX.equalTo(nextButton.snp.centerX)
            $0.top.equalTo(nextButton.snp.bottom)
        }
    }
    
}
