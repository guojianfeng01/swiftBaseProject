//
//  MLBannerView.swift
//  ManaLoanSwift
//
//  Created by guojianfeng on 2017/6/7.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

import UIKit
import SnapKit

typealias backBlockType = (NSInteger, NSArray) -> Void
class MLBannerView: UIView {
    
    var placeholderImageString: NSString?
    var imageViewType: UIViewContentMode?
    var clickActionBlock: backBlockType?
    var timer: Timer?
    
    var _imgArray: NSArray?
    var imgArray: NSArray?{
        
        set{
            _imgArray = newValue
            self.pageControl?.numberOfPages = (newValue?.count)!
            self.carousel?.reloadData()
        }
        
        get{
            return _imgArray
        }
    }
    
    var _rolltType:iCarouselType?
    var rolltType:iCarouselType?{
        get{
            return _rolltType
        }
        
        set{
            _rolltType = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Private
    func nextImage(){
        var index = (self.carousel?.currentItemIndex)! + 1
        if index == self.imgArray?.count {
            index = 0
        }
        self.carousel?.scrollToItem(at: index, animated: true)
    }
    
    func addTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func removeTimer(){
        self.timer?.invalidate()
    }
    
    //MARK: LazyLoad
    lazy var carousel: iCarousel? = {
        let carousel = iCarousel()
        carousel.delegate = self
        carousel.dataSource = self
        carousel.isPagingEnabled = true
        carousel.bounces = false
        self.addSubview(carousel)
        carousel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return carousel
    }()
    
    lazy var pageControl: UIPageControl? = {
        let pageControl = UIPageControl()
        if self.imgArray != nil {
            pageControl.numberOfPages = (self.imgArray?.count)!
        }
        self.carousel?.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        return pageControl
    }()
}


extension MLBannerView: iCarouselDelegate, iCarouselDataSource {
    //MARK: iCarouselProtocl
    func numberOfItems(in carousel: iCarousel) -> Int {
        if self.imgArray == nil {
            return 0;
        }
        return (_imgArray?.count)!
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var tmpView = view
        let imgWidth = self.bounds.size.width
        let imgHeigth = self.bounds.size.height
        let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: imgWidth, height: imgHeigth))
        let imgString: String = self.imgArray?[index] as! String
        if imgString.hasPrefix("http") == false {
            imgView.image = UIImage.init(named: imgString)
        }
        tmpView = imgView
        return tmpView!
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        self.pageControl?.currentPage = carousel.currentItemIndex
    }
    
    func carouselWillBeginDragging(_ carousel: iCarousel) {
        self.removeTimer()
    }
    
    func carouselDidEndDragging(_ carousel: iCarousel, willDecelerate decelerate: Bool) {
        self.addTimer()
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        if self.clickActionBlock != nil{
            self.clickActionBlock!(index, imgArray!)
        }
    }

}
