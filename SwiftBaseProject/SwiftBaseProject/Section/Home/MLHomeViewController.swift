//
//  MLHomeViewController.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/5.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit

let kMaxLoanQuota = "2000"
let kMinLoanQuota = "500"
let kMaxLoanDays  = "30"
let kMinLoanDays  = "7"
class MLHomeViewController: ViewController{
    //MARK: Property
    private var bannerImages: [String]! = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    //MARK: Private
    private func updateUI(){
        if ManaUserHelper.sharedManager.isLogin && ManaUserHelper.sharedManager.isAuth{
            
        }else{
            self.amountView!.snp.makeConstraints { (make) in
                make.top.equalTo((self.bannerView?.snp.bottom)!)
                make.left.right.equalTo(self.contenView!)
                make.height.equalTo(80)
                make.bottom.equalTo((self.contenView?.snp.bottom)!)
            }
            
            self.sliderView!.snp.makeConstraints{ (make) in
                make.top.equalTo(self.amountView!.snp.bottom).offset(5);
                make.left.right.equalTo(self.contenView!);
                make.bottom.equalTo(self.contenView!);
            }
        }
    }
    
    //MARK: lazy load
    private lazy var scrollview: UIScrollView? = {
        let scrollview = UIScrollView.init(frame: CGRect.zero)
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.isScrollEnabled = true
        scrollview.bounces = true
        let contentHeight: CGFloat = self.view.frame.height - 64
        scrollview.contentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height - 64)
        self.view.addSubview(scrollview)
        scrollview.snp.makeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        })
        return scrollview
    }()
    
    private lazy var contenView: UIView? = {
        let contentView = UIView.init(frame: CGRect.zero)
        contentView.backgroundColor = UIColor.lightGray
        self.scrollview?.addSubview(contentView)
        contentView.snp.makeConstraints({ (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(self.view.frame.width)
        })
        return contentView
    }()
    
    private lazy var bannerView: MLBannerView? = {
        let bannerView = MLBannerView.init(frame: CGRect.zero)
        bannerView.backgroundColor = UIColor.lightGray
        bannerView.placeholderImageString = "home_banner_placeholder"
        bannerView.imgArray = ["meinv","home_banner_placeholder","meinv","home_banner_placeholder"]
        self.contenView?.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(self.view.frame.maxX * 2/5)
        }
        return bannerView
    }()
    
    private  lazy var amountView: MLHomeMoneyView? = {
        let amountView = MLHomeMoneyView.init(frame: CGRect.zero)
        amountView.isUserInteractionEnabled = true
        amountView.amountDetailLabel?.text = "借款金额"
        amountView.interestDetailLabel?.text = "借款天数"
        amountView.numberOfDaysDetailLabel?.text = "最低日利率"
        self.contenView?.addSubview(amountView)
        amountView.snp.makeConstraints { (make) in
            make.top.equalTo((self.bannerView?.snp.bottom)!)
            make.left.right.equalTo(self.contenView!)
            make.height.equalTo(80)
        }
        return amountView
    }()
    
    lazy var sliderView: MLSliderView? = {
        let sliderView = MLSliderView()
        sliderView.setButtonTitle("申请借款")
        sliderView.setMaxPermittedAmount(kMaxLoanQuota)
        sliderView.setMimPermittedAmount(kMinLoanQuota)
        sliderView.setMaxPermittedDay(kMaxLoanDays)
        sliderView.setMimPermittedDay(kMinLoanDays)
        self.contenView!.addSubview(sliderView)
        return sliderView
    }()
}
