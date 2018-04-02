//
//  AccessibleView.swift
//  TesteWWDC18
//
//  Created by Renata on 16/03/18.
//  Copyright © 2018 Renata. All rights reserved.
//

import UIKit
import AVFoundation


public class AccessibleView: UIView {
    private var accLabel : String?
    var isSelected = false
    let hideBorderNotification = Notification.Name(rawValue: resetViewKey)
    
    /// -> do not do this anymore!!!  <-
    //  ->  let myPlayer = Player()   <-
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    public init(frame: CGRect, label : String?, isActionable : Bool) {
        super.init(frame: frame)
        if label == nil {
            self.accLabel = "You should add something to people know what is this thing"
        } else {
            self.accLabel = label!
        }
        
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true
        self.layer.borderColor = UIColor.black.cgColor
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.playAccLabel(_:)))
        tapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGesture)
        createObserver()
    }
    
    func changeAccLabel(label : String){
        if label != ""{
            self.accLabel = label
        }
    }
    
    deinit {
        //deleting my observers :)
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObserver(){
        //notification to remove border
        NotificationCenter.default.addObserver(self, selector: #selector(AccessibleView.resetViewStatus(notification:)), name: hideBorderNotification, object: nil)
    }
    
    //notification to deselect item
    @objc func resetViewStatus(notification: NSNotification){
        self.layer.borderWidth = 0
        isSelected = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func change(accessibleLabel: String) {
        self.accLabel = accessibleLabel
    }
    
    @objc func playAccLabel(_ sender: UITapGestureRecognizer) {
        /// -> be careful to no create a new instance of player next time ;D <-
        Player.play(speechString: self.accLabel!)
        
        ///first reset all views status --> isSelected and Border
        let name = Notification.Name(rawValue: resetViewKey)
        NotificationCenter.default.post(name: name, object: nil)
        
        ///now you can simple add the status you want
        isSelected = true
        updateBorder()
    }
    
    
    
    func updateBorder(){
        if isSelected {
            self.layer.borderWidth = 3
        } else {
            self.layer.borderWidth = 0
        }
    }
    
}

