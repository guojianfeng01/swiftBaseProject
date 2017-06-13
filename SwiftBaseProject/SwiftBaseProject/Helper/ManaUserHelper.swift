//
//  ManaUserHelper.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/8.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit

class ManaUserHelper: NSObject {
    open var isLogin: Bool = false
    open var isAuth: Bool = false
    open var token: String = ""
    open var username: String = ""
    
    class var sharedManager : ManaUserHelper {
        struct Static {
            static let sharedInstance : ManaUserHelper = ManaUserHelper()
        }
        return Static.sharedInstance
    }
    
    override init() {
        super.init()
    }
}
