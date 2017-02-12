//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var peopleTitle: UILabel!
    @IBOutlet weak var people1: UIButton!
    @IBOutlet weak var people2: UIButton!
    @IBOutlet weak var people3: UIButton!
    @IBOutlet weak var people4: UIButton!
    @IBOutlet weak var people5: UIButton!
    @IBOutlet weak var peopleMore: UIButton!
    var peopleCount = 2 //默认2人数 以此来判断pickerView的初始位置
    
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var starMore: UIButton!
    var starCount = 15  //15% 默认三颗星  以此来判断pickerView的初始位置
    
    var pickerSelect = 0 //0表示未选，1为people，2为star
    
    
    @IBAction func tapPeople(_ sender: UIButton) {
        peopleCount = sender.tag
        updatePeopleIcon(count: peopleCount)
        peopleTitle.text = peopleSplitStringMake(number: peopleCount)
    }
    
    
    func updatePeopleIcon(count:Int) {
        people1.isSelected = (people1.tag <= count)
        people2.isSelected = (people2.tag <= count)
        people3.isSelected = (people3.tag <= count)
        people4.isSelected = (people4.tag <= count)
        people5.isSelected = (people5.tag <= count)
        peopleMore.isSelected = (peopleMore.tag <= count)
    }
    
    
    @IBAction func peopleMore(_ sender: UIButton) {
        pickerSelect = 1
        setAlertView()
    }
    
    @IBAction func tapStar(_ sender: UIButton) {
        
        starCount = sender.tag * 5
        updateStarIcon(count: sender.tag)
        starTitle.text = serviceStringMake(percentage: starCount)
        
    }
    
    func updateStarIcon(count:Int) {
        star1.isSelected = (star1.tag <= count)
        star2.isSelected = (star2.tag <= count)
        star3.isSelected = (star3.tag <= count)
        star4.isSelected = (star4.tag <= count)
        star5.isSelected = (star5.tag <= count)
        starMore.isSelected = (starMore.tag <= count)
    }
    
    
    @IBAction func starMore(_ sender: UIButton) {
        pickerSelect = 2
        setAlertView()
    }
    
    func setAlertView() {
        let alertController:UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        if pickerSelect == 1 {
            pickerView.selectRow(peopleCount-1, inComponent: 0, animated: false)
        }else {
            pickerView.selectRow(starCount, inComponent: 0, animated: false)
        }
        
        alertController.view.addSubview(pickerView)
        
        let OKBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(OKBtn)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

