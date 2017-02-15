//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet weak var peopleView: UIStackView!
    @IBOutlet weak var peopleTitle: UILabel!
    @IBOutlet weak var people1: UIButton!
    @IBOutlet weak var people2: UIButton!
    @IBOutlet weak var people3: UIButton!
    @IBOutlet weak var people4: UIButton!
    @IBOutlet weak var people5: UIButton!
    @IBOutlet weak var peopleMore: UIButton!
    var peopleCount = 2 //默认2人数 以此来判断pickerView的初始位置
    
    @IBOutlet weak var starView: UIStackView!
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var starMore: UIButton!
    var starCount = 15  //15% 默认三颗星  以此来判断pickerView的初始位置
    
    @IBOutlet weak var textField: UITextField!
    
    //用于弹出的视图
    var popView:UIView!
    var backgroundView:UIView!
    var pickerView:UIPickerView!
    var pickerSelect = 0 //0表示未选，1为people，2为star
    
    //弹出数字输入视图
    var numInputView:UIInputView!
    
    //一个手势识别，用于pickerView
    var backgroundGestrue:UITapGestureRecognizer!
    
    @IBAction func tapPeople(_ sender: UIButton) {
        peopleCount = sender.tag
        updatePeopleIcon(count: peopleCount)
        peopleTitle.text = peopleSplitStringMake(number: peopleCount)
    }
    
    
    func updatePeopleIcon(count:Int) {
        for v in peopleView.subviews {
            if v.isKind(of: UIButton.self) {
                let people = v as! UIButton
                people.isSelected = (people.tag <= count)
            }
        }
    }
    
    
    @IBAction func peopleMore(_ sender: UIButton) {
        pickerSelect = 1
//        setAlertView()
        popPickerView()
        textField.resignFirstResponder()
    }
    
    @IBAction func tapStar(_ sender: UIButton) {
        
        starCount = sender.tag * 5
        updateStarIcon(count: sender.tag)
        starTitle.text = serviceStringMake(percentage: starCount)
        
    }
    
    func updateStarIcon(count:Int) {
        for v in starView.subviews {
            if v.isKind(of: UIButton.self) {
                let star = v as! UIButton
                star.isSelected = (star.tag <= count)
            }
        }
    }
    
    
    @IBAction func starMore(_ sender: UIButton) {
        pickerSelect = 2
//        setAlertView()
        popPickerView()
        textField.resignFirstResponder()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = "$0"

    }

    
    
}

