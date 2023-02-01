//
//  LoginStepper.swift
//  Import
//
//  Created by 박준하 on 2023/01/31.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class LoginStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return IMPORTStep.loginIsRequired
    }
}
