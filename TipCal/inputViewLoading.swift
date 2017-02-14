//
//  inputViewLoading.swift
//  TipCal
//
//  Created by mvarxer on 17/2/14.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

extension ViewController:InputViewDelegate {
    
    
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
        ("c",4,1,1,1),
        
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
    
    func ButtonClick(){
        print("hehe")
    }
    
}
