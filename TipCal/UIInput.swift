//
//  UIInput.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

protocol InputViewDelegate {

    func space() -> Int  //间隔
    func numberOfRows() -> Int
    func numberOfColumns() -> Int
    func buttonSetting() -> [(title:String,xTag:Int,yTag:Int,xCount:Int,yCount:Int,normalImage:UIImage,highlightImage:UIImage,tag:Int)]  //一个按钮可能占了几个小格子  比如("title",1,1,1,2） 表示一个按钮在占据第一行第一列，水平方向1个格，垂直方向占2个格
    func ButtonClick(_ tag:Int)
    
}


class UIInputView: UIView {

    var viewHeight:CGFloat!
    var delegate:InputViewDelegate?
    var buttonArray:[UIButton] = []
    var isShow = false
    var isCreated = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewHeight = self.bounds.height
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeFrame(xTag:Int,yTag:Int,xCount:Int,yCount:Int) -> CGRect {
        
        let unitWidth = (self.bounds.width - CGFloat(((delegate?.numberOfColumns())! + 1) * (delegate?.space())!)) / CGFloat((delegate?.numberOfColumns())!)
        let unitHeight = (self.bounds.height - CGFloat(((delegate?.numberOfRows())! + 1) * (delegate?.space())!)) / CGFloat((delegate?.numberOfRows())!)
        
        let x:CGFloat = CGFloat((delegate?.space())! * xTag) + CGFloat(xTag - 1) * unitWidth
        let y:CGFloat = CGFloat((delegate?.space())! * yTag) + CGFloat(yTag - 1) * unitHeight
        
        let width = CGFloat(xCount) * unitWidth + CGFloat((xCount - 1)*(delegate?.space())!)
        let height = CGFloat(yCount) * unitHeight + CGFloat((yCount - 1)*(delegate?.space())!)
        return CGRect(x: x, y: y, width: width, height: height)

    }
    
    func creatButton() {
        for b in (delegate?.buttonSetting())! {
            let btn = UIButton(frame: makeFrame(xTag:b.xTag,yTag:b.yTag,xCount:b.xCount,yCount:b.yCount))
            btn.setImage(b.normalImage, for: .normal)
            btn.setImage(b.highlightImage, for: .highlighted)
            btn.tag = b.tag
            btn.addTarget(self, action: #selector(UIInputView.btnClicked(_:)), for: .touchUpInside)
            buttonArray.append(btn)
            self.addSubview(btn)
            
        }
        isCreated = true
    }
    
    func show() {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - self.viewHeight , width: UIScreen.main.bounds.width , height: self.viewHeight)
        })
        isShow = true
    }
    
    func hide() {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height , width: UIScreen.main.bounds.width , height: self.viewHeight)
        }, completion: nil)
        isShow = false
    }

    
    func btnClicked(_ btn:UIButton) {
        delegate?.ButtonClick(btn.tag)
    }

}
