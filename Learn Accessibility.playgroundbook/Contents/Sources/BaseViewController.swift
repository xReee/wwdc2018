//
//  BaseViewController.swift
//  TesteWWDC18
//
//  Created by Renata on 24/03/18.
//  Copyright © 2018 Renata. All rights reserved.
//

import UIKit
import AVFoundation

@objc(BaseViewController)
public class BaseViewController: UIViewController {
    
   public var selectedViewNumber = 0
   public var myAccViews = [AccessibleView]()
    
   public func cortina(isActive : Bool) {
        view.backgroundColor = isActive ? .black : .white
        for view in self.view.subviews {
            if isActive {
                view.alpha = 0
            } else {
                view.alpha = 1
            }
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.isUserInteractionEnabled = true
        setupViews()
        
        if myAccViews.count > 0 {
            addSwipeGesture()
            addDoubleTapGesture()
        }
    }
    
    public func addSwipeGesture(){
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft(_:)))
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight(_:)))
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeGestureLeft)
        self.view.addGestureRecognizer(swipeGestureRight)
        
        //starts with the first view
    }
    
    public func addDoubleTapGesture(){
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.callAction(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTapGesture)
        
        //ignore it, just to start with a selected view (double tap it's just because we need a gesture recognizer :B)
        if myAccViews.count > 0 {
            myAccViews[0].playAccLabel(doubleTapGesture)
        }
            
        
    }

    @objc public func callAction(_ sender: UITapGestureRecognizer) {}
        
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setupViews(){}
    
    @objc public func didSwipeLeft(_ sender: UITapGestureRecognizer) {
            for i in 0 ..< myAccViews.count  {
                if myAccViews[i].isSelected {
                    selectedViewNumber = i
                }
            }
            myAccViews[selectedViewNumber].isSelected = false
            selectedViewNumber = selectedViewNumber == 0 ? myAccViews.count - 1 : selectedViewNumber - 1
            myAccViews[selectedViewNumber].playAccLabel(sender)
        }
        
    @objc public func didSwipeRight(_ sender: UITapGestureRecognizer) {
            for i in 0 ..< myAccViews.count  {
                if myAccViews[i].isSelected {
                    //what's the last selected view?
                    selectedViewNumber = i
                }
            }
            myAccViews[selectedViewNumber].isSelected = false
            selectedViewNumber = selectedViewNumber == (myAccViews.count - 1) ? 0 : selectedViewNumber + 1
            
            myAccViews[selectedViewNumber].playAccLabel(sender)
        }
    
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer.numberOfTouches == 2 {
            return true
        }
        return false
    }
        
}
