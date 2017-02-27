//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    
    var soundID:SystemSoundID = 0
    
    @IBOutlet weak var upperGesture: UIView!//接受手势关闭弹出视图
   
    @IBOutlet weak var upperView: UIImageView!
    
    @IBOutlet weak var dish: UIImageView!

    @IBOutlet weak var peopleTitleView: UIView!
    var peopleTitle:StringView! = nil
    

    @IBOutlet weak var peopleSelectorBar: SelectorBar!
    @IBOutlet weak var peopleMore: UIButton!
    var peopleCount = 2 //默认2人数 以此来判断pickerView的初始位置

    @IBOutlet weak var starTitleView: UIView!
    var starTitle:StringView! = nil

    @IBOutlet weak var starSelectorBar: SelectorBar!
    @IBOutlet weak var starMore: UIButton!
    var starCount = 3  // 默认三颗星  以此来判断pickerView的初始位置
    var service = 15  //表示15%
    
    //用于更新计算结果
    var checkamountView :StringView! = nil
    @IBOutlet weak var checkAmountDisplay: UIView! //checkamountView的父视图

    @IBOutlet weak var checkMountButton: UIButton!
    
    @IBOutlet weak var guestCheckView: GuestCheck!
  
    //用于弹出的视图
    var popView:UIView!
    var pickerSelect = 0 //0表示未选，1为people，2为star
    
    var peoplePopPickerView:PopPickerView!
    var starPopPickerView:PopPickerView!

    //弹出数字输入视图
    var numInputView:UIInputView!

    //一个手势识别，用于pickerView
    var backgroundGestrue:UITapGestureRecognizer!

    @IBAction func tapPeopleSelectorBar(_ sender: SelectorBar) {
        closeAllPopView()
        peopleMore.setImage(#imageLiteral(resourceName: "more_button_hidden"), for: .normal)
        peopleCount = sender.last
        peopleTitle.setPeopleNumber(num: peopleCount)
        guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)
        
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
        guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)
        
    }

    @IBAction func tapStarSelectorBar(_ sender: SelectorBar) {
        closeAllPopView()
        starMore.setImage(#imageLiteral(resourceName: "more_button_hidden"), for: .normal)
        starCount = starSelectorBar.last
        service = starCount * 5
        starTitle.setServicePercentage(percentage: service)
        
        guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)

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
            starPopPickerView.pickerView.selectRow(service, inComponent: 0, animated: false)
            starPopPickerView.show()
        }
        guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)

    }
    
    //按钮点，开启或关闭键盘
    @IBAction func tapCheckAmount(_ sender: UIButton) {
        if numInputView.isCreated == false { //输入按钮未创建
            numInputView.creatButton()
            
        }
        if numInputView.isShow {
            numInputView.hide()
            checkMountButton.setImage(nil, for: .normal)
        } else {
            closeAllPopView()
            checkMountButton.setImage(UIImage(named: "checkamount"), for: .normal)
            numInputView.show()

        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTitle = StringView(frame: CGRect(x: 0, y: 0, width: peopleTitleView.bounds.width, height: peopleTitleView.bounds.height))
        peopleTitle.setPeopleNumber(num: 2)
        peopleTitleView.addSubview(peopleTitle)

        starTitle = StringView(frame: CGRect(x: 0, y: 0, width: starTitleView.bounds.width, height: starTitleView.bounds.height))
        starTitle.setServicePercentage(percentage: 15)
        starTitleView.addSubview(starTitle)
        
        checkamountView = StringView(frame: CGRect(x: 0, y: 0, width: checkAmountDisplay.bounds.width, height: checkAmountDisplay.bounds.height))
        checkamountView.setNumber(numString: "0")
        checkAmountDisplay.addSubview(checkamountView)

        
        
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(closeAllPopView))
        upperGesture.addGestureRecognizer(gesture)
//        self.view.addGestureRecognizer(gesture)
        
        peoplePopPickerView  = PopPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.4 ))
        self.view.addSubview(peoplePopPickerView)
        
        starPopPickerView  = PopPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.4 ))
        self.view.addSubview(starPopPickerView)
        
        //
        numInputView = UIInputView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height*0.38 ))
        self.view.addSubview(numInputView)
        numInputView.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1)

        numInputView.delegate = self
        numInputView.creatButton()
        
       
        //初始隐藏账单
        guestCheckView.isHidden = true
        dish.isHidden = false
        
        setButtonSound()
        

    }
   
    //点击背景图关闭当前的弹出视图
    func closeAllPopView() {
        
        checkMountButton.setImage(nil, for: .normal)
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
        
        guestCheckView.updateGuestCheckView(people: peopleCount, service: service, checkAmout: Double(checkamountView.numberString)!)
    }
    
    func setButtonSound() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Tock", ofType: "caf")!)
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
    }
    

    
    
}

