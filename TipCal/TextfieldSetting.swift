//
//  TextfieldSetting.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController:UITextFieldDelegate {
    
    
 
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if numInputView == nil {
            print("inputView creat")
            numInputView = UIInputView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height*0.6, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.4))
            numInputView.backgroundColor = UIColor.darkGray
            numInputView.delegate = self
            textField.inputView = numInputView
        }
        numInputView.showInputView()
    }
    

    
    //禁止复制赞贴
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        //需要禁止显式textfield的长按出的按钮（什么粘贴复制类的）
        //OC里这样写的，在swift怎么写？
//        if ([UIMenuController sharedMenuController]) {
//            [UIMenuController sharedMenuController].menuVisible = NO;
//        }
        
        return false
        
        
    }
    
    //释放键盘  这里是否需要对键盘弹出视图做清理工作？待研究
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
}
