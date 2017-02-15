//
//  PopPickerView.swift
//  TipCal
//
//  Created by mvarxer on 17/2/15.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit



class PopPickerView: UIView {
    
    var popViewHeight:CGFloat!
    var pickerView:UIPickerView!
    var isShow:Bool = false
    
    override init(frame: CGRect) {

        super.init(frame:frame)
        popViewHeight = UIScreen.main.bounds.height * 0.4
        self.backgroundColor = .white
        self.alpha = 0.8
        
        pickerView = UIPickerView(frame: CGRect(x: 20, y: 20, width: self.bounds.width - 40, height: self.bounds.height - 40))
        self.addSubview(pickerView)
    }
    
    func show() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - self.popViewHeight , width: UIScreen.main.bounds.width , height: self.popViewHeight)
        })
        isShow = true
        
    }
    
    func hide() {

        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height , width: UIScreen.main.bounds.width , height: self.popViewHeight)
        }, completion: nil)
        isShow = false
        
    }
    
//    func popViewDismiss() {
//        UIView.animate(withDuration: 0.2, animations: {
//            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200 , width: UIScreen.main.bounds.width , height: 240)
//        }, completion: { (finished) in
//            self.pickerView.removeFromSuperview()
//            self.pickerView = nil
//        })
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



