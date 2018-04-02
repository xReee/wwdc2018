//
//  ViewController.swift
//  TesteWWDC18
//
//  Created by Renata on 15/03/18.
//  Copyright © 2018 Renata. All rights reserved.
//

import UIKit
import AVFoundation

@objc(ViewController)
public class ViewController: BaseViewController {
    
    var traveled = false
    
    //perguntar como que faz para ser UIImage e AccView
    let airshipImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "img.jpg")
        return imageView
    }()
    
    let labelView : UILabel = {
        let label = UILabel()
        label.text = "Traveling to San Jose"
        label.textAlignment = .center
        return label
    }()
    
    let travelButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("travel", for: UIControlState.normal)
        return button
    }()
    
    
    /// Acessible views declaration
    //this is for airshipImage
    let imgContentView = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:375) , label: "Image: photo from airplane window", isActionable: false)
    //this is for a label
    let labelContentView = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0), label: "Label: Traveling to San Jose", isActionable: false)
    //this is for a button
    let buttonContentView = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0), label: "Button: Double click to travel", isActionable: true)
    
    override public func setupViews(){
        
        
        ///add subviews
        //for img
        view.addSubview(imgContentView)
        imgContentView.addSubview(airshipImage)
        
        //for label
        view.addSubview(labelContentView)
        labelContentView.addSubview(labelView)
        
        //for button
        view.addSubview(buttonContentView)
        buttonContentView.addSubview(travelButton)
        
        ///content constraints
        //global height
        view.addConstraintsWithFormat(format: "V:|-30-[v0(500)][v1(50)]-50-[v2(50)]-100-|", views: imgContentView, labelContentView, buttonContentView)
        
        //img width
        imgContentView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: imgContentView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1))
        
        
        //label width
        view.addConstraint(NSLayoutConstraint.init(item: labelContentView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1))
        labelContentView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        
        //button width
        view.addConstraint(NSLayoutConstraint.init(item: buttonContentView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1))
        buttonContentView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonContentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        ///views constraint
        //image
        imgContentView.addConstraintsWithFormat(format: "V:|[v0]|", views: airshipImage)
        imgContentView.addConstraintsWithFormat(format: "H:|[v0]|", views: airshipImage)
        //label
        labelContentView.addConstraintsWithFormat(format: "V:|[v0]|", views: labelView)
        labelContentView.addConstraintsWithFormat(format: "H:|[v0]|", views: labelView)
        //button
        buttonContentView.addConstraintsWithFormat(format: "V:|[v0]|", views: travelButton)
        buttonContentView.addConstraintsWithFormat(format: "H:|[v0]|", views: travelButton)
        
        
        
        /// Add my views to an array (swipe)
        myAccViews.append(imgContentView)
        myAccViews.append(labelContentView)
        myAccViews.append(buttonContentView)
        
        
    }
    
    
    @objc public override func callAction(_ sender: UITapGestureRecognizer) {
        //received action and ask what the kind of selected View
        // entro na view q está selecionada com o 'selected view number' e verifico se ela tem um botão
        //for view in myAccViews[selectedViewNumber].subviews{
        //    if (view is UIButton ) {
        
        print(buttonContentView.isSelected)
        if buttonContentView.isSelected { //It doesn't work with the best way, then I will use the wrong way :(
            if !traveled {
                airshipImage.image = UIImage(named: "img2.jpg")
                labelView.text = "Label: Look, San Jose!"
                travelButton.setTitle("Airplane", for: UIControlState.normal)
                imgContentView.changeAccLabel(label: "Image: Photo of San Jose")
                labelContentView.changeAccLabel(label: "Label: Look, San Jose!")
                buttonContentView.changeAccLabel(label: "Button: Double tap to go back to airplane")
                
            } else {
                airshipImage.image = UIImage(named: "img.jpg")
                labelView.text = "Wellcome!"
                travelButton.setTitle("Travel", for: UIControlState.normal)
                imgContentView.changeAccLabel(label: "Image: photo from airplane window")
                labelContentView.changeAccLabel(label: "Label: Traveling to San Jose")
                buttonContentView.changeAccLabel(label: "Button: Double click to travel")
            }
            traveled = !traveled
        }
        //}
        
    }
    
}

struct Player {
    static let speechSynthesizer = AVSpeechSynthesizer()
    
    static func play(speechString : String){
        //stop
        speechSynthesizer.stopSpeaking(at: .immediate)
        //and run
        let speechUtterance = AVSpeechUtterance(string: speechString)
        speechSynthesizer.speak(speechUtterance)
        
    }
    
}


public extension ViewController {
    public class func instantiateFromStoryboard() -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        return viewController
    }
}

   

    
    



