//
//  GuestCheck.swift
//  TipCal
//
//  Created by mvarxer on 17/2/26.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit


@IBDesignable
class GuestCheck: UIView {

    @IBOutlet var contView: UIView!
    
    @IBOutlet weak var totalToPayLabel: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
    func updateGuestCheckView(people:Int,service:Int,checkAmout:Double) {
        let amount:Double = checkAmout
        let service:Double = Double(service) / 100.0
        let people:Double = Double(people)
        
        totalToPayLabel.text = makeString(doubleValue: (amount * service + amount))
        totalTipLabel.text = makeString(doubleValue: (amount * service ))
        totalPerPersonLabel.text = makeString(doubleValue: (amount * service + amount) / people)
        tipPerPersonLabel.text = makeString(doubleValue: (amount * service ) / people)
    }
    
    //保留精度小数点后2位，如果是整数就去掉小数点
    func makeString(doubleValue:Double) -> String {
        if Double(Int(doubleValue)) - doubleValue == 0 {
            return "$" + String(Int(doubleValue))
        }else {
            return "$" + String(format: "%.2f", doubleValue)
        }
        
    }

    func initFromXIB() {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: "GuestCheck", bundle: bundle)
        contView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contView.frame = bounds
        self.addSubview(contView)
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromXIB()
    }
    
    

}

