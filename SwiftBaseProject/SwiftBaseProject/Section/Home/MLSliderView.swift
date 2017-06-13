//
//  MLSliderView.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/8.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit

@IBDesignable
class MLSliderView: UIView, TTRangeSliderDelegate {
    //MARK: open property
    open var saveButtonClickBlock: (() -> String)?
    
    open var SilderMoneyChange: ((String) -> Void)?
    open var SilderDaysChange: ((String) -> Void)?
    
    //MARK: private property
    private var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
        self.makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARk: private action func
    @objc private func save(){
        if self.saveButtonClickBlock != nil {
            self.saveButtonClickBlock! = {() -> String in
                return self.title!
            }
        }
    }
    
    func makeConstraints(){
        self.moneySlider?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(30)
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(40)
        })
        
        self.daysSlider?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.moneySlider!.snp.bottom).offset(50)
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(40)
        })
        
        self.minMoneylabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.moneySlider!.snp.bottom)
            make.left.equalTo(self.moneySlider!.snp.left).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(15)
        })
        
        self.maxMoneylabel?.snp.makeConstraints { (make) in
            make.top.equalTo(self.moneySlider!.snp.bottom);
            make.right.equalTo(self.moneySlider!.snp.right).offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        
        self.minDayslabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.daysSlider!.snp.bottom);
            make.left.equalTo(self.daysSlider!.snp.left).offset(10);
            make.width.equalTo(100);
            make.height.equalTo(15);
        })
        
        self.maxDayslabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.daysSlider!.snp.bottom);
            make.left.equalTo(self.daysSlider!.snp.right).offset(10);
            make.width.equalTo(100);
            make.height.equalTo(15);
        })
        
        self.saveButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.top.equalTo(self.maxDayslabel!.snp.bottom).offset(25)
            make.height.equalTo(45)
        })
    }
    
    //MARK: - setter
    open func setButtonTitle(_ buttonTitle: String){
        self.saveButton?.setTitle(buttonTitle, for: UIControlState.normal)
        self.title = buttonTitle
    }
    
    open func setMaxPermittedAmount(_ maxPermittedAmount: String){
        self.moneySlider?.maxValue = Float(NSInteger((maxPermittedAmount as NSString).integerValue))
        self.maxMoneylabel?.text = maxPermittedAmount
    }
    
    open func setMimPermittedAmount(_ mimPermittedAmount: String){
        self.moneySlider!.minValue = Float((mimPermittedAmount as NSString).integerValue)
        self.moneySlider!.selectedMaximum = Float((mimPermittedAmount as NSString).integerValue)
        self.moneySlider!.selectedMinimum = Float((mimPermittedAmount as NSString).integerValue)
        self.minMoneylabel!.text = "mimPermittedAmount"
    }
    
    open func setSelectMinAmount(_ selectAmount: String) {
        self.moneySlider!.selectedMinimum = Float((selectAmount as NSString).integerValue)
    }
    
    open func setSelectMaxAmount(_ selectAmount: String) {
        self.moneySlider!.selectedMaximum = Float((selectAmount as NSString).integerValue)
    }
    
    open func setMaxPermittedDay(_ maxPermittedDay: String){
        self.daysSlider!.maxValue = Float((maxPermittedDay as NSString).integerValue)
        self.maxDayslabel!.text = maxPermittedDay
        
    }
    
    open func setMimPermittedDay(_ mimPermittedDay: String) {
        self.daysSlider!.minValue = Float((mimPermittedDay as NSString).integerValue)
        self.daysSlider!.selectedMaximum = Float((mimPermittedDay as NSString).integerValue)
        self.daysSlider!.selectedMinimum = Float((mimPermittedDay as NSString).integerValue)
        self.minDayslabel!.text = mimPermittedDay
    }
    
    //MARk: Delegate
    func rangeSlider(_ sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
        if (sender == self.moneySlider) {
            if ((self.SilderMoneyChange) != nil) {
                let str: String = String.init(format: "%.0f", selectedMaximum)
                self.SilderMoneyChange!(str)
            }
        }
        if (sender == self.daysSlider) {
            if (self.SilderDaysChange != nil) {
                let str: String = String.init(format: "%.0f", selectedMaximum)
                self.SilderDaysChange!(str);
            }
        }
    }
    
    //MARK: open Lazy property
    open lazy var minMoneylabel: UILabel? = {
        let minMoneylabel = UILabel()
        minMoneylabel.font = kFont_12
        minMoneylabel.textColor = kColor_hex(0xA8A8A8)
        minMoneylabel.textAlignment = .left
        minMoneylabel.text = "1000"
        self.addSubview(minMoneylabel)
        return minMoneylabel
    }()
    
    open lazy var maxMoneylabel: UILabel? = {
        let maxMoneylabel = UILabel()
        maxMoneylabel.font = kFont_12
        maxMoneylabel.textColor = kColor_hex(0xA8A8A8)
        maxMoneylabel.textAlignment = .right
        maxMoneylabel.text = "5000"
        self.addSubview(maxMoneylabel)
        return maxMoneylabel
    }()
    
    open lazy var minDayslabel: UILabel? = {
        let minDayslabel = UILabel()
        minDayslabel.font = kFont_12
        minDayslabel.textColor = kColor_hex(0xA8A8A8)
        minDayslabel.textAlignment = .left
        minDayslabel.text = "1天"
        self.addSubview(minDayslabel)
        return minDayslabel
    }()
    
    open lazy var maxDayslabel: UILabel? = {
        let maxDayslabel = UILabel()
        maxDayslabel.font = kFont_12
        maxDayslabel.textColor = kColor_hex(0xA8A8A8)
        maxDayslabel.textAlignment = .right
        maxDayslabel.text = "20天"
        self.addSubview(maxDayslabel)
        return maxDayslabel
    }()
    
    open lazy var saveButton: UIButton? = {
        let saveButton = UIButton()
        saveButton.backgroundColor = kColor_hex(0x2491FF)
        saveButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        saveButton.titleLabel?.font = kFont_18
        saveButton.layer.masksToBounds = true
        saveButton.layer.cornerRadius = 5
        saveButton.addTarget(self, action: #selector(save), for: UIControlEvents.touchUpInside)
        self.addSubview(saveButton)
        return saveButton
    }()
    
    //MARK: private Lazy property
    private lazy var moneySlider: TTRangeSlider? = {
        let moneySlider = TTRangeSlider.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: 40))
        moneySlider.tintColor = kColor_hex(0xE7E7E7)
        moneySlider.delegate = self
        moneySlider.disableRange = true
        moneySlider.handleColor = UIColor.white
        moneySlider.handleBorderColor = kColor_hex(0x2491FF)
        moneySlider.handleBorderWidth = 1
        moneySlider.handleDiameter = 30
        moneySlider.maxLabelColour = kColor_hex(0x5C5C5C)
        moneySlider.maxLabelFont = kFont_18
        moneySlider.selectedHandleDiameterMultiplier = 1
        moneySlider.tintColorBetweenHandles = kColor_hex(0x2491FF)
        moneySlider.enableStep = true
        moneySlider.step = 100
        moneySlider.lineHeight = 10
        let customFormatter: NumberFormatter = NumberFormatter()
        customFormatter.positiveSuffix = "元"
        moneySlider.numberFormatterOverride = customFormatter;
        self.addSubview(moneySlider)
        return moneySlider
    }()
    
    private lazy var daysSlider: TTRangeSlider? = {
        let daysSlider = TTRangeSlider.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: 40))
        daysSlider.tintColor = kColor_hex(0xE7E7E7)
        daysSlider.delegate = self
        daysSlider.disableRange = true
        daysSlider.minValue = 1
        daysSlider.maxValue = 20
        daysSlider.selectedMaximum = 20
        daysSlider.selectedMinimum = 1
        daysSlider.handleColor = UIColor.white
        daysSlider.handleBorderColor = kColor_hex(0x2491FF)
        daysSlider.handleBorderWidth = 1
        daysSlider.handleDiameter = 30
        daysSlider.maxLabelColour = kColor_hex(0x5C5C5C)
        daysSlider.maxLabelFont = kFont_18
        daysSlider.selectedHandleDiameterMultiplier = 1
        daysSlider.tintColorBetweenHandles = kColor_hex(0x2491FF)
        daysSlider.enableStep = true
        daysSlider.step = 100
        daysSlider.lineHeight = 10
        let customFormatter: NumberFormatter = NumberFormatter()
        customFormatter.positiveSuffix = "天"
        daysSlider.numberFormatterOverride = customFormatter;
        self.addSubview(daysSlider)
        return daysSlider
    }()
}
