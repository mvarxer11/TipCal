//
//  SelectorBar.swift
//  TipCal
//
//  Created by mvarxer on 17/2/22.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

@IBDesignable
class SelectorBar: UIControl {

    
    @IBInspectable
    public var count:Int = 5 { didSet { count = max(1, count) } } //至少1个
    @IBInspectable
    public var last:Int = 2 { didSet { last = min(max(last, atLeast), count) } }  //选择的数量比至少选的大，比总数少
    @IBInspectable
    public var atLeast:Int = 0 { didSet { atLeast = min(max(atLeast, 0), count)  } }  //
    @IBInspectable
    public var space:CGFloat = 0 { didSet { space = max(0, space) } }  //最小为0
    @IBInspectable
    public var starNormal:UIImage!
    @IBInspectable
    public var starSelected:UIImage!
    
    fileprivate var unitWidth:CGFloat = 0
    fileprivate var unitHeight:CGFloat = 0
    fileprivate var imageViews:[UIImageView] = []
    
    public func setLast(last:Int) {  //外部调用，输入数字设定选择了多少个星。
        self.last = last
        updateImage()
    }
    
    fileprivate func updateImage() { //更新星条状态
        for (i,view) in imageViews.enumerated() {
            if i < max(atLeast, last) {
                view.image = starSelected
            } else {
                view.image = starNormal
            }
        }
    }
    
    fileprivate func setup() {  //创建星条加入视图
        unitWidth = (self.bounds.width - space*CGFloat (count - 1)) / CGFloat(count)
        unitHeight = self.bounds.height
        for i in 1...count {
            let view = UIImageView(frame: CGRect(x: (unitWidth + space) * CGFloat(i-1), y: 0, width: unitWidth, height: unitHeight))
            view.contentMode = .scaleAspectFit
            imageViews.append(view)
            updateImage()
            self.addSubview(view)
        }
    }
    
    fileprivate func touchToDo(_ touch:UITouch) -> Bool {
        let point = touch.location(in: self)
        if point.x < 0 {
            self.last = 0
        } else {
            for (index,value) in imageViews.enumerated() {
                if value.frame.contains(point) {
                    self.last = index + 1
                    break
                }
            }
        }
        updateImage()
        sendActions(for: UIControlEvents.valueChanged)
        return true
        
    }
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print(touch.location(in: self).x)
        return touchToDo(touch)
        
    }
    
    public override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return touchToDo(touch)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        if imageViews.isEmpty {
            self.setup()
        }
    }
    
    //如果要支持绑定约束后旋转时重绘就需要执行下面的方法
    //    override public func layoutSubviews() {
    //        unitWidth = (self.bounds.width - space*CGFloat (starCount - 1)) / CGFloat(starCount)
    //        unitHeight = self.bounds.height
    //        for (i,view) in imageViews.enumerated() {
    //            view.frame = CGRect(x: (unitWidth + space) * CGFloat(i), y: 0, width: unitWidth, height: unitHeight)
    //            print(view.frame)
    //
    //        }
    //        print("run layoutSubview()")
    //    }
    
    
    //    override init(frame:CGRect) {
    //        super.init(frame: frame)
    //    }
    //
    //    required public init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //    }

}
