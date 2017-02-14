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

        numInputView = UIInputView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height*0.6, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.4))
        numInputView.backgroundColor = UIColor.darkGray
        numInputView.delegate = self
        
        numInputView.showInputView()
        textField.inputView = numInputView
        

    }// became first responder
//
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            
//            textField.resignFirstResponder()
//            return true
//        }
    
}
