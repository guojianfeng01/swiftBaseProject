//
//  MLHomeMoneyView.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/8.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit

class MLHomeMoneyView: UIView {
    
    var expainMoneyBlock: (() -> Void)?
    var expainDayBlock: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: private
    func makeConstraints(){
        self.amountLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(self.snp.width).dividedBy(3)
        })
        
        self.amountDetailLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self).offset(-13)
            make.height.equalTo(20)
            make.centerX.equalTo(self).dividedBy(3).offset(-7)
            make.width.greaterThanOrEqualTo(10)
        })
        
        self.explainButton1?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.amountDetailLabel?.snp.right)!).offset(2)
            make.size.equalTo(CGSize.init(width: 15, height: 15))
            make.centerY.equalTo((self.amountDetailLabel?.snp.centerY)!)
        })

        self.interestLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo((self.amountLabel?.snp.right)!)
            make.height.equalTo(30)
            make.width.equalTo(self.snp.width).dividedBy(3)
        })

        self.interestDetailLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self).offset(-13)
            make.height.equalTo(20)
            make.centerX.equalTo(self.snp.centerX).offset(-7)
            make.width.greaterThanOrEqualTo(10)
        })

        self.explainButton2?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.interestDetailLabel?.snp.right)!).offset(2)
            make.size.equalTo(CGSize.init(width: 15, height: 15))
            make.centerY.equalTo((self.interestDetailLabel?.snp.centerY)!)
        })
        
        self.numberOfDaysLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo((self.interestLabel?.snp.right)!)
            make.height.equalTo(30)
            make.width.equalTo(self.snp.width).dividedBy(3)
        })
        
        self.numberOfDaysDetailLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self).offset(-13)
            make.left.equalTo((self.interestLabel?.snp.right)!)
            make.height.equalTo(20)
            make.width.equalTo(self.snp.width).dividedBy(3)
        })
    }
    
    func hiddenExplainButtons() {
        self.explainButton1?.isHidden = true
        self.explainButton2?.isHidden = true
        self.amountDetailLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX).dividedBy(3)
        })
        
        self.interestDetailLabel?.snp.updateConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX)
        })
    }
    
    //MARK: action
    func explain1(){
        if self.expainMoneyBlock != nil {
            self.expainMoneyBlock!()
        }
    }
    
    func explain2(){
        if self.expainDayBlock != nil {
            self.expainDayBlock!()
        }
    }
    //MARK: Lazy 
    lazy var amountLabel: UILabel? = {
        let amountLabel = UILabel()
        amountLabel.font = kFont_21
        amountLabel.textColor = kColor_hex(0x5C5C5C)
        amountLabel.textAlignment = .center
        self.addSubview(amountLabel)
        return amountLabel
    }()
    
    lazy var amountDetailLabel: UILabel? = {
        let amountDetailLabel = UILabel()
        amountDetailLabel.font = kFont_12
        amountDetailLabel.textColor = kColor_hex(0xA8A8A8)
        amountDetailLabel.textAlignment = .center
        amountDetailLabel.text = "到账金额"
        self.addSubview(amountDetailLabel)
        return amountDetailLabel
    }()
    
    lazy var interestLabel: UILabel? = {
        let interestLabel = UILabel()
        interestLabel.font = kFont_21
        interestLabel.textColor = kColor_hex(0x5c5c5c)
        interestLabel.textAlignment = .center
        self.addSubview(interestLabel)
        return interestLabel
    }()
    
    lazy var interestDetailLabel: UILabel? = {
        let interestDetailLabel = UILabel()
        interestDetailLabel.font = kFont_12
        interestDetailLabel.textColor = kColor_hex(0xA8A8A8)
        interestDetailLabel.textAlignment = .center
        interestDetailLabel.text = "手续费+利率"
        self.addSubview(interestDetailLabel)
        return interestDetailLabel
    }()
    
    lazy var numberOfDaysLabel: UILabel? = {
        let numberOfDaysLabel = UILabel()
        numberOfDaysLabel.font = kFont_21
        numberOfDaysLabel.textColor = kColor_hex(0x5c5c5c)
        numberOfDaysLabel.textAlignment = .center
        self.addSubview(numberOfDaysLabel)
        return numberOfDaysLabel
    }()
    
    lazy var numberOfDaysDetailLabel: UILabel? = {
        let numberOfDaysDetailLabel = UILabel()
        numberOfDaysDetailLabel.font = kFont_12
        numberOfDaysDetailLabel.textColor = kColor_hex(0xA8A8A8)
        numberOfDaysDetailLabel.textAlignment = .center
        numberOfDaysDetailLabel.text = "借款天数"
        self.addSubview(numberOfDaysDetailLabel)
        return numberOfDaysDetailLabel
    }()
    
    lazy var explainButton1: UIButton? = {
        let explainButton1 = UIButton.init(type: UIButtonType.custom)
        explainButton1.setBackgroundImage(UIImage.init(named: "reminder_icon"), for: UIControlState.normal)
        explainButton1.addTarget(self, action: #selector(explain1), for: UIControlEvents.touchUpInside)
        self.addSubview(explainButton1)
        return explainButton1
    }()
    
    lazy var explainButton2: UIButton? = {
        let explainButton2 = UIButton.init(type: UIButtonType.custom)
        explainButton2.setBackgroundImage(UIImage.init(named: "reminder_icon"), for: UIControlState.normal)
        explainButton2.addTarget(self, action: #selector(explain2), for: UIControlEvents.touchUpInside)
        self.addSubview(explainButton2)
        return explainButton2
    }()
}
