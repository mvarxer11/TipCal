//
//  inputViewLoading.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController:InputViewDelegate {
    func ButtonClick(_ title:String) {
        var resultString:String = checkAmountDisplay.text!
        resultString.characters.removeFirst()  //"去掉$"
        
        switch title {
        case "1","2","3","4","5","6","7","8","9","0":
            if resultString.characters.count <= 9 {//最多支持9个数字（包括小数点）
                if resultString != "0" {
                    resultString += title
                }else {
                    resultString = title
                }
            }
        case ".":
            if !resultString.contains(".") && resultString.characters.count <= 9  {  //确保不包含.的情况再下输入.
                resultString += title
            }
        case "⌫":
            if resultString != "0" {  //在非0情况下删除
                if resultString.characters.count == 1 { //如"$2"仅剩余两个字符,再删除一个就变"$0"
                    resultString = "0"
                }else {
                    resultString.characters.removeLast()
                }
            }
        case "C":
            resultString = "0"
        case "Done":
            if resultString.characters.last == "." { //如果确定后最有一个字符是“.”无意义，移除它。
                resultString.characters.removeLast()
            }
            numInputView.hide()
            checkAmountDisplay.backgroundColor = .gray

            
        default:
            break
        }
        checkAmountDisplay.text = "$" + resultString
        
    }
    
    func space() -> Int{
        return 5
    }
    
    func numberOfRows() -> Int{
        return 4
    }
    func numberOfColumns() -> Int{
        return 4
    }

    
    //列(x)、行(y)
    func buttonSetting() -> [(title:String,xTag:Int,yTag:Int,xCount:Int,yCount:Int)] {
        return [
        ("7",1,1,1,1),
        ("8",2,1,1,1),
        ("9",3,1,1,1),
        ("C",4,1,1,1),
        
        ("4",1,2,1,1),
        ("5",2,2,1,1),
        ("6",3,2,1,1),
        ("⌫",4,2,1,2),
        
        ("1",1,3,1,1),
        ("2",2,3,1,1),
        ("3",3,3,1,1),
        
        ("0",1,4,2,1),
        (".",3,4,1,1),
        ("Done",4,4,1,1),

        ]
    }
    
}
