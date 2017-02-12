//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

let personArray = [
            "No split",
            "2 People Split",
            "3 People Split",
            "4 People Split",
            "5 People Split",
            "6 People Split",
            "7 People Split",
            "8 People Split",
            "9 People Split",
            "10 People Split"
]

let starArray = [
            "0% Service Included",
            "5% Service Poor",
            "10% Service Fair",
            "15% Service Good!",
            "20% Service Great!",
            "25% Service Excellent!",
            "30% Service Excellent!",
            "35% Service Excellent!",
            "40% Service Excellent!",
            "45% Service Excellent!",
            "50% Service Excellent!"
]

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var peopleTitle: UILabel!
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var person1: UIButton!
    @IBOutlet weak var person2: UIButton!
    @IBOutlet weak var person3: UIButton!
    @IBOutlet weak var person4: UIButton!
    @IBOutlet weak var person5: UIButton!
    @IBOutlet weak var personMore: UIButton!
    var personCount = 1 //默认2人数 以此来判断pickerView的初始位置
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var starMore: UIButton!
    var starCount = 3  //默认三颗星  以此来判断pickerView的初始位置
    
    var pickerSelect = 0 //0表示未选，1为people，2为star
    
    
    @IBAction func person(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            person1.isSelected = true
            person2.isSelected = false
            person3.isSelected = false
            person4.isSelected = false
            person5.isSelected = false
            personMore.isSelected = false
            personCount = 0
            peopleTitle.text = "No Split"
        case 2:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = false
            person4.isSelected = false
            person5.isSelected = false
            personMore.isSelected = false
            personCount = 1
            peopleTitle.text = "2 People Split"
        case 3:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = false
            person5.isSelected = false
            personMore.isSelected = false
            personCount = 2
            peopleTitle.text = "3 People Split"
        case 4:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = true
            person5.isSelected = false
            personMore.isSelected = false
            personCount = 3
            peopleTitle.text = "4 People Split"
        case 5:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = true
            person5.isSelected = true
            personMore.isSelected = false
            personCount = 4
            peopleTitle.text = "5 People Split"
        default:
            break
        }
    }

    @IBAction func personMore(_ sender: UIButton) {
        pickerSelect = 1
        setAlertView()
    }
    
    @IBAction func star1(_ sender: UIButton) {
        
        if sender.isSelected == true {
            sender.isSelected = false
            switch sender.tag {
            case 1:
                star2.isSelected = false
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "0% Service Included"
                starCount = 0
            case 2:
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "5% Service Poor"
                starCount = 1
            case 3:
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "10% Service Fair"
                starCount = 2
            case 4:
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "15% Service Good!"
                starCount = 3
            case 5:
                 starMore.isSelected = false
                starTitle.text = "20% Service Great!"
                starCount = 4
            default:
                break
            }
    
        }else {
            sender.isSelected = true
            switch sender.tag {
            case 1:
                star2.isSelected = false
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "5% Service Poor"
                starCount = 1
            case 2:
                star1.isSelected = true
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starTitle.text = "10% Service Fair"
                starCount = 2
            case 3:
                star1.isSelected = true
                star2.isSelected = true
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "15% Service Good!"
                starCount = 3
            case 4:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star5.isSelected = false
                starMore.isSelected = false
                starTitle.text = "20% Service Great!"
                starCount = 4
            case 5:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
                starMore.isSelected = false
                starTitle.text = "25% Service Excellent!"
                starCount = 5
            default:
                break
            }
        }
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
            pickerView.selectRow(personCount, inComponent: 0, animated: false)
        }else {
            pickerView.selectRow(starCount, inComponent: 0, animated: false)
        }
        
        
        alertController.view.addSubview(pickerView)
        
        let cancelBtn = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelBtn)
        self.present(alertController, animated: true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //组件数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //每组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerSelect == 1 {
            return personArray.count
        }else {
            return starArray.count
        }
        
        
    }
    
    //每行的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerSelect == 1 {
            return personArray[row]
        }else {
            return starArray[row]
        }
    }
    
    //选项改变后，触发代理事件
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerSelect == 1 {
            peopleTitle.text = personArray[row]
            personCount = row
            switch row {
            case 0:
                person1.isSelected = true
                person2.isSelected = false
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
                personMore.isSelected = false
                personCount = 0
            case 1:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
                personMore.isSelected = false
            case 2:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person4.isSelected = false
                person5.isSelected = false
                personMore.isSelected = false
            case 3:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person4.isSelected = true
                person5.isSelected = false
                personMore.isSelected = false
            case 4:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person4.isSelected = true
                person5.isSelected = true
                personMore.isSelected = false
            default:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person4.isSelected = true
                person5.isSelected = true
                personMore.isSelected = true
            }
            
            
        }else {
            starTitle.text = starArray[row]
            starCount = row
            switch row {
            case 0:
                star1.isSelected = false
                star2.isSelected = false
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
                starCount = 0
            case 1:
                star1.isSelected = true
                star2.isSelected = false
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
            case 2:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
            case 3:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = false
                star5.isSelected = false
                starMore.isSelected = false
            case 4:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
                star5.isSelected = false
                starMore.isSelected = false
            case 5:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
                star5.isSelected = true
                starMore.isSelected = false
            default:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
                star5.isSelected = true
                starMore.isSelected = true
            }
   
        }
  
    }



}

