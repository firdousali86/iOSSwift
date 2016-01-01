//
//  Enum.swift
//  testProj
//
//  Created by Firdous on 30/12/2015.
//  Copyright © 2015 TenPearls. All rights reserved.
//

import Foundation

enum ControllerExceptions: ErrorType {
    case InvalidClassName
    case NoViewInNib
    case NibNotFound
    case NibNotSubClassOfBaseView
}