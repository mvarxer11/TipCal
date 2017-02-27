//
//  inputViewLoading.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit
import AudioToolbox
extension ViewController:InputViewDelegate {
    

    
    func ButtonClick(_ tag:Int) {
        
        AudioServicesPlaySystemSound(soundID)
        
        var resultString:String = checkamountView.numberString

        
        switch tag {
        case 1,2,3,4,5,6,7,8,9,0:
            if resultString.characters.count < 6 {//最多支持6个数字（包括小数点）
                if resultString != "0" {
                    resultString += String(tag)
                }else {
                    resultString = String(tag)
                }
            }
        case 13:  //.
            if !resultString.contains(".") && resultString.characters.count <= 9  {  //确保不包含.的情况再下输入.
                resultString += "."
            }
        case 12: //回退
            if resultString != "0" {  //在非0情况下删除
                if resultString.characters.count == 1 { //如"$2"仅剩余两个字符,再删除一个就变"$0"
                    resultString = "0"
                }else {
                    resultString.characters.removeLast()
                }
            }
        case 11:   //c
            resultString = "0"
        case 14: //done
            if resultString == "0" {
                guestCheckView.isHidden = true //隐藏账单
                dish.isHidden = false
            }else {
                if resultString.characters.last == "." { //如果确定后最有一个字符是“.”无意义，移除它。
                    resultString.characters.removeLast()
                }

                guestCheckView.isHidden = false //显式账单
                dish.isHidden = true
                //更新账单内容
                guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)
            }
            numInputView.hide()
        default:
            break
        }
        checkamountView.setNumber(numString: resultString)
        
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
    func buttonSetting() -> [(title:String,xTag:Int,yTag:Int,xCount:Int,yCount:Int,normalImage:UIImage,highlightImage:UIImage,tag:Int)] {
        return [
        ("7",1,1,1,1,#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "7_press"),7),
        ("8",2,1,1,1,#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "8_press"),8),
        ("9",3,1,1,1,#imageLiteral(resourceName: "9"),#imageLiteral(resourceName: "9_press"),9),
        ("C",4,1,1,1,#imageLiteral(resourceName: "c"),#imageLiteral(resourceName: "c_press"),11),
        
        ("4",1,2,1,1,#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "4_press"),4),
        ("5",2,2,1,1,#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "5_press"),5),
        ("6",3,2,1,1,#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "6_press"),6),
        ("⌫",4,2,1,2,#imageLiteral(resourceName: "backspace"),#imageLiteral(resourceName: "backspace_press"),12),
        
        ("1",1,3,1,1,#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "1_press"),1),
        ("2",2,3,1,1,#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2_press"),2),
        ("3",3,3,1,1,#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "3_press"),3),
        
        ("0",1,4,2,1,#imageLiteral(resourceName: "0"),#imageLiteral(resourceName: "0_press"),0),
        (".",3,4,1,1,#imageLiteral(resourceName: "dot"),#imageLiteral(resourceName: "dot_press"),13),
        ("Done",4,4,1,1,#imageLiteral(resourceName: "tipdone"),#imageLiteral(resourceName: "done_press"),14),

        ]
    }
    
}
