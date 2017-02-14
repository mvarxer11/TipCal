//
//  TextfieldSetting.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController:UITextFieldDelegate {
    

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        
        let temp = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height*0.6, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.4))
        temp.backgroundColor = .red
        textField.inputView = temp
            
        print("sdfsdf")

        return true
    }// return NO to disallow editing.
    
 
    func textFieldDidBeginEditing(_ textField: UITextField) {

        numInputView = UIInputView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height*0.6, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.4))
        numInputView.backgroundColor = UIColor.darkGray
        numInputView.delegate = self
        
        numInputView.showInputView()
//        self.view.addSubview(numInputView)
        textField.inputView = numInputView
        

    }// became first responder
//
//   
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        
//    }// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//    
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//    }// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//    
//    
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
//        
//    }// if implemented, called in place of textFieldDidEndEditing:
//    
//    
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//    }// return NO to not change text
//    
//    
//
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        
//    }// called when clear button pressed. return NO to ignore (no notifications)
//    
// 
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//    }// called when 'return' key pressed. return NO to ignore.
    
    //取消光标，释放键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
}
