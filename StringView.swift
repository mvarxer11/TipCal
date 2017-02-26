//
//  StringView.swift
//  TipCal
//
//  Created by mvarxer on 17/2/23.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit


class StringView: UIView {

    fileprivate var scaling:CGFloat = 1.0  //图片和外框间的缩放比例
    fileprivate var titleNumbers:[String] = []
    fileprivate var titleStrings:[String] = []
    fileprivate var space:CGFloat = 10.0
    fileprivate var imageViews:[UIImageView] = []
    fileprivate var theHeightest:CGFloat = 0
    
    public var numberString:String = ""

    //用于更新计算结果视图
    //输入一个浮点数，更新视图（比如32.34，视图图片会显示$32.34,自动加上$符号）
    public func setNumber(numString:String) {
        self.numberString = numString
        titleNumbers = []
        titleNumbers.append("$")
        for c in numString.characters {
            titleNumbers.append(String(c))
        }
        var length:CGFloat = 0
        drawPhoto(scale:1,numberScale:0.9)
        for view in imageViews {
            length += view.bounds.width
        }
        
        var begin:CGFloat = self.bounds.width - length
        for view in imageViews {
            view.frame.origin.x = begin
            begin += view.frame.size.width
            view.frame.origin.y = view.frame.size.width * 0.4
        }
    }
    
    //设置选人数的标题视图
    public func setPeopleNumber(num:Int) {  //1-50
        
        switch num {
        case 1:  //至少一人
            titleNumbers = []
            titleStrings = ["no_split"]
        case 2...100:
            titleNumbers = IntToStringArray(num: num)
            titleStrings = ["people_split"]
        default:
            break
        }
        
        drawPhoto(scale: 0.9, numberScale: 1)
        
    }
    
    //设置选服务的标题视图
    public func setServicePercentage(percentage:Int) {  //0-50
        titleNumbers = IntToStringArray(num: percentage)
        switch percentage {
        case 0:
            titleStrings = ["service","included"]
        case 1...5:
            titleStrings = ["service","poor"]
        case 6...10:
            titleStrings = ["service","fair"]
        case 11...15:
            titleStrings = ["service","good"]
        case 16...20:
            titleStrings = ["service","great"]
        case 21...50:
            titleStrings = ["service","excellent"]
        default:
            break
        }
        drawPhoto(scale: 0.9, numberScale: 1)
    }
    
    fileprivate func IntToStringArray(num:Int) -> [String] {
        var resultString:[String] = []
        for c in String(num).characters {
            resultString.append(String(c))
        }
        return resultString
    }
    
    
    
    //绘制字符图片  scale是为了调节整体大小的。numberScale是数字大小
    private func drawPhoto(scale:CGFloat,numberScale:CGFloat) {
        clear()
        var x:CGFloat = 0 //每个子视图的x坐标
        if !titleNumbers.isEmpty {
            for name in titleNumbers {
                let image:UIImage!
                switch name {
                    case "$":
                        image = #imageLiteral(resourceName: "currency_0")
                    case ".":
                        image = #imageLiteral(resourceName: "text_10_big")
                    default:
                        image = UIImage(named: "text_" + name + "_big")
                }
                let width:CGFloat = image.size.width * scale * numberScale
                let height:CGFloat = image.size.height * scale * numberScale
                let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: width, height: height))
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                imageViews.append(imageView)
                self.addSubview(imageView)
                x += width
            }
        }
        if !titleStrings.isEmpty {
            for name in titleStrings {
                let image:UIImage!
                if name == "service" {
                    image = #imageLiteral(resourceName: "service") //% service是连在一起的 和前面的数字不用考虑空格
                } else {
                    image = UIImage(named:"text_" + name)
                }
                let width:CGFloat = image.size.width * scale
                let height:CGFloat = image.size.height * scale
                let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: width, height: height))
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                imageViews.append(imageView)
                self.addSubview(imageView)
                x += width + 10  //间距
            }
        }
    }
    
    

    

    
    fileprivate func clear() {
        //清理数组、remove子视图
        if !imageViews.isEmpty {
            for index in imageViews {
                index.removeFromSuperview()
            }
            imageViews = []
        }
    }
    
    
    override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

}
