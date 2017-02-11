//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit


//let peopleLabelArray = ["No Split","]


class ViewController: UIViewController {

    @IBOutlet weak var peopleTitle: UILabel!
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var person1: UIButton!
    @IBOutlet weak var person2: UIButton!
    @IBOutlet weak var person3: UIButton!
    @IBOutlet weak var person4: UIButton!
    @IBOutlet weak var person5: UIButton!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    @IBAction func person(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            person1.isSelected = true
            person2.isSelected = false
            person3.isSelected = false
            person4.isSelected = false
            person5.isSelected = false
            peopleTitle.text = "No Split"
        case 2:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = false
            person4.isSelected = false
            person5.isSelected = false
            peopleTitle.text = "2 People Split"
        case 3:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = false
            person5.isSelected = false
            peopleTitle.text = "3 People Split"
        case 4:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = true
            person5.isSelected = false
            peopleTitle.text = "4 People Split"
        case 5:
            person1.isSelected = true
            person2.isSelected = true
            person3.isSelected = true
            person4.isSelected = true
            person5.isSelected = true
            peopleTitle.text = "5 People Split"
        default:
            break
        }
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
                starTitle.text = "0% Service Included"
            case 2:
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starTitle.text = "5% Service Poor"
            case 3:
                star4.isSelected = false
                star5.isSelected = false
                starTitle.text = "10% Service Fair"
            case 4:
                star5.isSelected = false
                starTitle.text = "15% Service Good!"
            case 5:
                starTitle.text = "20% Service Great!"
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
                starTitle.text = "5% Service Poor"
            case 2:
                star1.isSelected = true
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
                starTitle.text = "10% Service Fair"
            case 3:
                star1.isSelected = true
                star2.isSelected = true
                star4.isSelected = false
                star5.isSelected = false
                starTitle.text = "15% Service Good!"
            case 4:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star5.isSelected = false
                starTitle.text = "20% Service Great!"
            case 5:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
                starTitle.text = "25% Service Excellent!"
            default:
                break
            }
        }
    }

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

