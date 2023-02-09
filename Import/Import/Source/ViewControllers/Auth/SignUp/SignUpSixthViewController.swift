//
//  SignUpSixthViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit
import Then
import SnapKit

class SignUpSixthViewController: BaseVC {
    
    private lazy var GoodImage = UIImageView().then {
        let imageName = "GoodIcon"
        $0.image = UIImage(named: imageName)
    }
    
    internal lazy var firstTitle = UILabel().then {
        $0.text = "축하드립니다!"
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .Black
    }
    
    internal lazy var secondTitle = UILabel().then {
        $0.text = "새로운 계정을 등록했어요\n이제 Import를 시작해 보세요!"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 2
        $0.textColor = .Gray600
        $0.textAlignment = .center
    }
    
    internal lazy var nextButton = UIButton().then {
        $0.setTitle("계속", for: .normal)
        $0.setTitleColor(UIColor.White, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.backgroundColor = .Primary
        $0.layer.cornerRadius = 8.0
    }
    
    private lazy var joinDeveloperButton = UIButton().then {
        $0.setTitle("개발자로 가입하기", for: .normal)
        $0.setTitleColor(UIColor.Gray600, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.layer.cornerRadius = 8.0
    }
    
    override func layout() {
        [
            GoodImage,
            firstTitle,
            secondTitle,
            nextButton,
            joinDeveloperButton
        ].forEach { view.addSubview($0) }
        
        GoodImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(263.0)
            $0.height.width.equalTo(200.0)
        }
        
        firstTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(GoodImage.snp.bottom).offset(60.0)
        }
        
        secondTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstTitle.snp.bottom).offset(10.0)
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(secondTitle.snp.bottom).offset(189.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48.0)
            $0.width.equalTo(398.0)
        }
        
        joinDeveloperButton.snp.makeConstraints {
            $0.height.equalTo(nextButton.snp.height)
            $0.width.equalTo(nextButton.snp.width)
            $0.centerX.equalTo(nextButton.snp.centerX)
            $0.top.equalTo(nextButton.snp.bottom)
        }
    }
}
