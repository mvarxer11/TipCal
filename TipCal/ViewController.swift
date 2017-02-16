//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var upperView: UIView! //接受手势关闭弹出视图
    //原本使用根视图接受手势，但会导致点击到键盘间隙时关闭键盘
    
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
    
    @IBOutlet weak var checkAmountDisplay: UILabel!
    
    
    @IBOutlet weak var guestCheckView: UIView!
    @IBOutlet weak var totalToPayLabel: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
    

    
    //用于弹出的视图
//    var popView:UIView!
    var pickerSelect = 0 //0表示未选，1为people，2为star
    
    var peoplePopPickerView:PopPickerView!
    var starPopPickerView:PopPickerView!
    
    //弹出数字输入视图
    var numInputView:UIInputView!
    
    //一个手势识别，用于pickerView
    var backgroundGestrue:UITapGestureRecognizer!
    
    @IBAction func tapPeople(_ sender: UIButton) {
        
        closeAllPopView()
        peopleCount = sender.tag
        updatePeopleIcon(count: peopleCount)
        peopleTitle.text = peopleSplitStringMake(number: peopleCount)
        updateGuestCheckView()
    }
    
    
    func updatePeopleIcon(count:Int) {
        for v in peopleView.subviews {
            if v.isKind(of: UIButton.self) {
                let people = v as! UIButton
                people.isSelected = (people.tag <= count)
            }
        }
    }
    
    
    var peoplePickerIsShow = false
    
    @IBAction func peopleMore(_ sender: UIButton) {

        pickerSelect = 1
        if peoplePopPickerView.isShow {
            peoplePopPickerView.pickerView.delegate = nil
            peoplePopPickerView.pickerView.dataSource = nil
            peoplePopPickerView.hide()
            
        }else {
            closeAllPopView()
            peoplePopPickerView.pickerView.delegate = self
            peoplePopPickerView.pickerView.dataSource = self
            peoplePopPickerView.pickerView.selectRow(peopleCount - 1, inComponent: 0, animated: false)
            peoplePopPickerView.show()
        }
        
    }
    
    @IBAction func tapStar(_ sender: UIButton) {
        
        closeAllPopView()
        starCount = sender.tag * 5
        updateStarIcon(count: sender.tag)
        starTitle.text = serviceStringMake(percentage: starCount)
        updateGuestCheckView()
        
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
        if starPopPickerView.isShow {
            starPopPickerView.pickerView.delegate = nil
            starPopPickerView.pickerView.dataSource = nil
            starPopPickerView.hide()
        }else {
            closeAllPopView()
            starPopPickerView.pickerView.delegate = self
            starPopPickerView.pickerView.dataSource = self
            starPopPickerView.pickerView.selectRow(starCount, inComponent: 0, animated: false)
            starPopPickerView.show()
        }

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(closeAllPopView))
        self.view.addGestureRecognizer(gesture)
//        upperView.backgroundColor = .blue
//        upperView.addGestureRecognizer(gesture)
        peoplePopPickerView  = PopPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.4 ))
        self.view.addSubview(peoplePopPickerView)
        
        starPopPickerView  = PopPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.4 ))
        self.view.addSubview(starPopPickerView)
        
        numInputView = UIInputView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.4 ))
        self.view.addSubview(numInputView)
        numInputView.backgroundColor = .darkGray
        
        self.checkAmountDisplay.isUserInteractionEnabled = true //Label默认是false
        self.checkAmountDisplay.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(TapCheckAmountDisplay)))
        
        numInputView.delegate = self
        

        numInputView.creatButton()
        
        //初始隐藏账单
        hideGuestCheckView()
        

    }
    
 
    
    
    
    func TapCheckAmountDisplay() {
        
//        if numInputView.isCreated == false { //输入按钮未创建
//            numInputView.creatButton()
//
//        }
        if numInputView.isShow {
            numInputView.hide()
            checkAmountDisplay.backgroundColor = .clear
        } else {
            closeAllPopView()
            numInputView.show()
            checkAmountDisplay.backgroundColor = .yellow  //输入时背景变绿
        }
        
        
        
    }
    
        //点击背景图关闭当前的弹出视图
        func closeAllPopView() {
            
            checkAmountDisplay.backgroundColor = .clear
            if peoplePopPickerView.isShow {
                peoplePopPickerView.pickerView.delegate = nil
                peoplePopPickerView.pickerView.dataSource = nil
                peoplePopPickerView.hide()
            }
            if starPopPickerView.isShow {
                starPopPickerView.pickerView.delegate = nil
                starPopPickerView.pickerView.dataSource = nil
                starPopPickerView.hide()
            }
            if numInputView.isShow {
                numInputView.hide()
            }
            updateGuestCheckView()
        }
    
    
}

