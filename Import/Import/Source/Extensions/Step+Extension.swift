//
//  Step+Extension.swift
//  Import
//
//  Created by 박준하 on 2023/02/01.
//

import RxFlow

extension Step {
    var asIMPORTStep: IMPORTStep? {
        return self as? IMPORTStep
    }
}
