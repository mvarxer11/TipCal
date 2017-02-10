//
//  ViewController.swift
//  TipCal
//
//  Created by mvarxer on 17/2/9.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        if sender.isSelected == true {
            sender.isSelected = false
            switch sender.tag {
            case 1:
                person2.isSelected = false
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
            case 2:
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
            case 3:
                person4.isSelected = false
                person5.isSelected = false
            case 4:
                person5.isSelected = false
            case 5: break
            default:
                break
            }
            
        }else {
            sender.isSelected = true
            switch sender.tag {
            case 1:
                person2.isSelected = false
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
            case 2:
                person1.isSelected = true
                person3.isSelected = false
                person4.isSelected = false
                person5.isSelected = false
            case 3:
                person1.isSelected = true
                person2.isSelected = true
                person4.isSelected = false
                person5.isSelected = false
            case 4:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person5.isSelected = false
            case 5:
                person1.isSelected = true
                person2.isSelected = true
                person3.isSelected = true
                person4.isSelected = true
            default:
                break
            }
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
            case 2:
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
            case 3:
                star4.isSelected = false
                star5.isSelected = false
            case 4:
                star5.isSelected = false
            case 5: break
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
            case 2:
                star1.isSelected = true
                star3.isSelected = false
                star4.isSelected = false
                star5.isSelected = false
            case 3:
                star1.isSelected = true
                star2.isSelected = true
                star4.isSelected = false
                star5.isSelected = false
            case 4:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star5.isSelected = false
            case 5:
                star1.isSelected = true
                star2.isSelected = true
                star3.isSelected = true
                star4.isSelected = true
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

