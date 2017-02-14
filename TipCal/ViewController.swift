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
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

    }

    
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
            updatePeopleIcon(count: peopleCount)
            
        }else {
            starTitle.text = serviceStringMake(percentage: row)
            starCount = row
            updateStarIcon(count: starCount/5)
        }
    }
    
}

