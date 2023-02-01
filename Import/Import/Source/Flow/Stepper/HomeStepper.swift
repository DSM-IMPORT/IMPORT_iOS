//
//  HomeStepper.swift
//  Import
//
//  Created by 박준하 on 2023/02/01.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class HomeStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return IMPORTStep.homeIsRequired
    }
}
