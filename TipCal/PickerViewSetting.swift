//
//  PickerViewSetting.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate{

    
    
    //组件数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //每组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerSelect == 1 {
            return 100  //people 1-100
        }else {
            return 51 //(ServiceString 从0%到50%包含0所以是51个)
        }
    }
    
    //每行的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerSelect == 1 {
            return peopleSplitStringMake(number: row + 1 ) //至少1人
        }else {
            return serviceStringMake(percentage: row)
        }
    }
    
    //选项改变后，触发代理事件
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerSelect == 1 {
            peopleTitle.text = peopleSplitStringMake(number: row + 1)
            peopleCount = row + 1
            peopleSelectorBar.setLast(last: peopleCount)
        }else {
            starTitle.text = serviceStringMake(percentage: row)
            service = row
            starCount = row/5
            starSelectorBar.setLast(last: starCount)
        }
    }
    
}
