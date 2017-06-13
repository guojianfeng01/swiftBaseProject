//
//  MLTabBarController.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/5.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit

class MLTabBarController: UITabBarController {
    var homeNavVc: MLNavigationController!
    var mineNavVc: MLNavigationController!
    var orderNavVc: MLNavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        homeNavVc = MLNavigationController.init(rootViewController: homeVc)
        mineNavVc = MLNavigationController.init(rootViewController: mineVc)
        orderNavVc = MLNavigationController.init(rootViewController: orderVc)
        self.setViewControllers([homeNavVc,orderNavVc,mineNavVc], animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: lazy
    lazy var homeVc: MLHomeViewController = {
        let homeVc = MLHomeViewController()
        homeVc.title = "首页"
        homeVc.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tab_home_nor"), selectedImage: UIImage.init(named: "tab_home_sel"))
        return homeVc
    }()
    
    lazy var mineVc: MLMineViewController = {
        let mineVc = MLMineViewController()
        mineVc.title = "我的"
        mineVc.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "tab_data_nor"), selectedImage: UIImage.init(named: "tab_data_sel"))
        return mineVc
    }()
    
    lazy var orderVc: MLOrderViewController = {
        let orderVc = MLOrderViewController()
        orderVc.title = "订单"
        orderVc.tabBarItem = UITabBarItem.init(title: "订单", image: UIImage.init(named: "tab_bonus_nor"), selectedImage: UIImage.init(named: "tab_bonus_sel"))
        return orderVc
    }()
}
