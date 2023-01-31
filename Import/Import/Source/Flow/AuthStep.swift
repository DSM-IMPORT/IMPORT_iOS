//
//  AuthStep.swift
//  Import
//
//  Created by 박준하 on 2023/01/31.
//

import Foundation
import RxFlow

enum AuthStep: Step {
    
    case loginIsRequired
    case homeIsRequired
}
