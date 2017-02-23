//
//  MakeString.swift
//  TipCal
//
//  Created by mvarxer on 17/2/24.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import Foundation


//参数：percentage 百分数
//根据给的百分数返回ServiceString
func serviceStringMake(percentage:Int)->String {
    switch percentage {
    case 0:
        return "0% Service Included"
    case 1...5:
        return String(percentage) + "% Service Poor"
    case 6...10:
        return String(percentage) + "% Service Fair"
    case 11...15:
        return String(percentage) + "% Service Good!"
    case 16...20:
        return String(percentage) + "% Service Great!"
    default:
        return String(percentage) + "% Service Excellent!"
    }
    
}

//根据给定人数返回peopleSplitString
func peopleSplitStringMake(number:Int)->String {
    if number == 1 {
        return "No Split"
    }else {
        return String(number) + " People Split"
    }
}
