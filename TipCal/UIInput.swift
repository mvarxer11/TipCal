//
//  UIInput.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

protocol InputViewDelegate {
    //大体上的行列，先不考虑一个按钮占几个格
    func space() -> Int  //间隔
    func numberOfRows() -> Int
    func numberOfColumns() -> Int
    func buttonSetting() -> [(title:String,xTag:Int,yTag:Int,xCount:Int,yCount:Int)]  //一个按钮可能占了几个小格子
    //arr = [("title",1,1,1,2] 比如这个按钮位于第12行 第4列
    func ButtonClick()
    
}


class UIInputView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegate:InputViewDelegate?

    
    var resultString:String = ""
    var buttonArray:[UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeFrame(xTag:Int,yTag:Int,xCount:Int,yCount:Int) -> CGRect {
        
        print(xTag,yTag,xCount,yCount)
        let unitWidth = (self.bounds.width - CGFloat(((delegate?.numberOfColumns())! + 1) * (delegate?.space())!)) / CGFloat((delegate?.numberOfColumns())!)
        let unitHeight = (self.bounds.height - CGFloat(((delegate?.numberOfRows())! + 1) * (delegate?.space())!)) / CGFloat((delegate?.numberOfRows())!)
        
        let x:CGFloat = CGFloat((delegate?.space())! * xTag) + CGFloat(xTag - 1) * unitWidth
        let y:CGFloat = CGFloat((delegate?.space())! * yTag) + CGFloat(yTag - 1) * unitHeight
        
        let width = CGFloat(xCount) * unitWidth + CGFloat((xCount - 1)*(delegate?.space())!)
        let height = CGFloat(yCount) * unitHeight + CGFloat((yCount - 1)*(delegate?.space())!)
        print(CGRect(x: x, y: y, width: width, height: height))
        return CGRect(x: x, y: y, width: width, height: height)

    }
    
    func creatButton() {
        for b in (delegate?.buttonSetting())! {
            let btn = UIButton(frame: makeFrame(xTag:b.xTag,yTag:b.yTag,xCount:b.xCount,yCount:b.yCount))
            btn.backgroundColor = .lightGray
            btn.layer.cornerRadius = 5
            btn.setTitle(b.title, for: .normal)
            btn.addTarget(self, action: #selector(self.doWithClick), for: .touchUpInside)
            buttonArray.append(btn)
            self.addSubview(btn)
            print(btn)
        }
    }
    
    func showInputView() {
        creatButton()
    }
    
    deinit {
        
        print("deinit")
    }
    
    func doWithClick() {
        print("sdlkslkdjf")
        delegate?.ButtonClick()
    }

}
