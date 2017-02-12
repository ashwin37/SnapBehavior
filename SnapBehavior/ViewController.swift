//
//  ViewController.swift
//  SnapBehavior
//
//  Created by Ashwin Tallapaka on 2/12/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var snapBtn: [UIButton]! //OutletCollection is selected as the option in order to make all 3 buttons in to one single conncetion !!
    
    var snap : UISnapBehavior!
    var animator : UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)

    self.view.layoutIfNeeded()
        
        for btn in snapBtn {
           
            let originalPos = btn.center
            btn.center = CGPoint(x: self.view.frame.width/2, y: -btn.frame.height)
            // -button.frame.height is to set the buttons to the right position after snap behavior !!
            snap = UISnapBehavior(item: btn, snapTo: originalPos)
            snap.damping = 0.2
            animator.addBehavior(snap)
        }
    }
    
    @IBAction func sanp1Pressed(_ sender: Any)
    {
        animator.removeAllBehaviors()
        
        let position = CGPoint(x: self.view.frame.width / 2, y: (sender as AnyObject).frame.height)
        snap = UISnapBehavior(item: sender as! UIDynamicItem, snapTo: position)
        snap.damping = 0.2
        animator.addBehavior(snap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        animator.removeAllBehaviors()
        
        for touch in touches {
        
        let location = touch.location(in: self.view)
        let btn2 = snapBtn[1]
        
        snap = UISnapBehavior(item: btn2, snapTo: location)
        snap.damping = 0.2
        animator.addBehavior(snap)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        animator.removeAllBehaviors()
        
        for touch in touches {
            
            let location = touch.location(in: self.view)
            let btn2 = snapBtn[1]
            
            snap = UISnapBehavior(item: btn2, snapTo: location)
            snap.damping = 0.2
            animator.addBehavior(snap)
        }
    }
   }
