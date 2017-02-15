//
//  popPickerViewFunction.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController {
    
    //1、使用AlertViewController弹出PickerView
    
    
//    func setAlertView() {
//        let alertController:UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
//        
//        let pickerView = UIPickerView()
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        if pickerSelect == 1 {
//            pickerView.selectRow(peopleCount-1, inComponent: 0, animated: false)
//        }else {
//            pickerView.selectRow(starCount, inComponent: 0, animated: false)
//        }
//        
//        alertController.view.addSubview(pickerView)
//        
//        let OKBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(OKBtn)
//        self.present(alertController, animated: true, completion: nil)
//    }
    
//----------------------------------------------------------------------------------------
    
    //2、使用UIView.animate弹出PickerView
    
    
    
    func popPickerView() {
        
        let popViewHeight = UIScreen.main.bounds.height * 0.4
        
        //创建全透明底层接收手势
        backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = .clear
        backgroundGestrue = UITapGestureRecognizer.init(target: self, action: #selector(popViewDismiss))
        backgroundView.addGestureRecognizer(backgroundGestrue)
        
        //弹出的视图初始创建在屏幕外下方
        popView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: popViewHeight ))
        popView.backgroundColor = .white
        popView.alpha = 0.8
        
        
        
        pickerView = UIPickerView(frame: CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: popViewHeight - 40))
        pickerView.delegate = self
        pickerView.dataSource = self
        if pickerSelect == 1 {
            pickerView.selectRow(peopleCount-1, inComponent: 0, animated: false)
        }else {
            pickerView.selectRow(starCount, inComponent: 0, animated: false)
        }
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(popView)
        popView.addSubview(pickerView)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.backgroundColor = UIColor.init(white: 0.0, alpha: 0)
            self.popView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - popViewHeight , width: UIScreen.main.bounds.width , height: popViewHeight)
        })
        
    }
    
    func popViewDismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
            self.popView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200 , width: UIScreen.main.bounds.width , height: 240)
        }, completion: { (finished) in
            self.pickerView.removeFromSuperview()
            self.popView.removeFromSuperview()
            self.backgroundView.removeGestureRecognizer(self.backgroundGestrue)
            self.backgroundView.removeFromSuperview()
            self.backgroundView = nil
            self.popView = nil
            self.pickerView.delegate = nil
            self.pickerView.dataSource = nil
            self.pickerView = nil
            
        })
        
    }
    
    
    
}
