//
//  CalculatorViewController.swift
//  TesteWWDC18
//
//  Created by Renata on 23/03/18.
//  Copyright © 2018 Renata. All rights reserved.
//

import UIKit

@objc(CalculatorViewController)
public class CalculatorViewController: BaseViewController {
    
    var isActive2 = false
    
    public func resultContent() -> String {
        return self.labelView.text!
    }
    
    let bt00 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("0", for: UIControlState.normal)
        return button
    }()

    let bt01 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("1", for: UIControlState.normal)
        return button
    }()
    let bt02 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("2", for: UIControlState.normal)
        return button
    }()
    let bt03 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("3", for: UIControlState.normal)
        return button
    }()
    let bt04 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("4", for: UIControlState.normal)
        return button
    }()
    let bt05 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("5", for: UIControlState.normal)
        return button
    }()
    
    let btmenos : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("-", for: UIControlState.normal)
        return button
    }()
    
    let btmais : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("+", for: UIControlState.normal)
        return button
    }()
    
    let btigual : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("=", for: UIControlState.normal)
        return button
    }()
    
    let btclear : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("clear", for: UIControlState.normal)
        return button
    }()
    
    let labelView : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    public func changeAccLabel(tag: Int, newLabel: String) {
        myAccViews[tag].changeAccLabel(label: newLabel)
    }
    
    
    /// Acessible views declaration
    //this is for button 0
    let bt00Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button 01
    let bt01Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button 02
    let bt02Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button 03
    let bt03Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button 04
    let bt04Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button 05
    let bt05Content = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for button +
    let btmaisContent = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for -
    let btmenosContent = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for =
    let btigualContent = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    //this is for clear
    let btClearlContent = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UIButton", isActionable: false)
    
    let labelResultContent = AccessibleView(frame: CGRect(x: 0, y: 0, width: 0, height:0) , label: "UILabel", isActionable: false)

    
    override public func setupViews(){
        //for bt 0
        view.addSubview(bt00Content)
        bt00Content.addSubview(bt00)
        //for bt 1
        view.addSubview(bt01Content)
        bt01Content.addSubview(bt01)
        //for bt 2
        view.addSubview(bt02Content)
        bt02Content.addSubview(bt02)
        //for bt 3
        view.addSubview(bt03Content)
        bt03Content.addSubview(bt03)
        //for bt 4
        view.addSubview(bt04Content)
        bt04Content.addSubview(bt04)
        //for bt 5
        view.addSubview(bt05Content)
        bt05Content.addSubview(bt05)
        //for bt +
        view.addSubview(btmaisContent)
        btmaisContent.addSubview(btmais)
        //for bt -
        view.addSubview(btmenosContent)
        btmenosContent.addSubview(btmenos)
        //for bt =
        view.addSubview(btigualContent)
        btigualContent.addSubview(btigual)
        //for label
        view.addSubview(labelResultContent)
        labelResultContent.addSubview(labelView)
        //for clear
        view.addSubview(btClearlContent)
        btClearlContent.addSubview(btclear)
        
        //I should make a function but I will be confused
        ///Constraints
        //label
        labelResultContent.translatesAutoresizingMaskIntoConstraints = false
        labelResultContent.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        labelResultContent.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: labelResultContent, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50))
        view.addConstraint(NSLayoutConstraint.init(item: labelResultContent, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1))
        //first collum
        //bt00
        bt00Content.translatesAutoresizingMaskIntoConstraints = false
        bt00Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt00Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt00Content, attribute: .top, relatedBy: .equal, toItem: labelResultContent, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt00Content, attribute: .left, relatedBy: .equal, toItem: labelResultContent, attribute: .left, multiplier: 1, constant: 0))
        //bt02
        bt02Content.translatesAutoresizingMaskIntoConstraints = false
        bt02Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt02Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt02Content, attribute: .top, relatedBy: .equal, toItem: bt00Content, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt02Content, attribute: .left, relatedBy: .equal, toItem: labelResultContent, attribute: .left, multiplier: 1, constant: 0))
        //bt04
        bt04Content.translatesAutoresizingMaskIntoConstraints = false
        bt04Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt04Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt04Content, attribute: .top, relatedBy: .equal, toItem: bt02Content, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt04Content, attribute: .left, relatedBy: .equal, toItem: labelResultContent, attribute: .left, multiplier: 1, constant: 0))
        //second collum
        //bt01
        bt01Content.translatesAutoresizingMaskIntoConstraints = false
        bt01Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt01Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt01Content, attribute: .top, relatedBy: .equal, toItem: labelResultContent, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt01Content, attribute: .centerX, relatedBy: .equal, toItem: labelResultContent, attribute: .centerX, multiplier: 1, constant: 0))
        //bt03
        bt03Content.translatesAutoresizingMaskIntoConstraints = false
        bt03Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt03Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt03Content, attribute: .top, relatedBy: .equal, toItem: bt01Content, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt03Content, attribute: .centerX, relatedBy: .equal, toItem: labelResultContent, attribute: .centerX, multiplier: 1, constant: 0))
        //bt5
        bt05Content.translatesAutoresizingMaskIntoConstraints = false
        bt05Content.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        bt05Content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: bt05Content, attribute: .top, relatedBy: .equal, toItem: bt03Content, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: bt05Content, attribute: .centerX, relatedBy: .equal, toItem: labelResultContent, attribute: .centerX, multiplier: 1, constant: 0))
        //third collum
        //bt +
        btmaisContent.translatesAutoresizingMaskIntoConstraints = false
        btmaisContent.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        btmaisContent.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: btmaisContent, attribute: .top, relatedBy: .equal, toItem: labelResultContent, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: btmaisContent, attribute: .right, relatedBy: .equal, toItem: labelResultContent, attribute: .right, multiplier: 1, constant: 0))
        //bt -
        btmenosContent.translatesAutoresizingMaskIntoConstraints = false
        btmenosContent.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        btmenosContent.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: btmenosContent, attribute: .top, relatedBy: .equal, toItem: btmaisContent, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: btmenosContent, attribute: .right, relatedBy: .equal, toItem: labelResultContent, attribute: .right, multiplier: 1, constant: 0))
        //bt =
        btigualContent.translatesAutoresizingMaskIntoConstraints = false
        btigualContent.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        btigualContent.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: btigualContent, attribute: .top, relatedBy: .equal, toItem: btmenosContent, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: btigualContent, attribute: .right, relatedBy: .equal, toItem: labelResultContent, attribute: .right, multiplier: 1, constant: 0))
        
        //bt clear
        btClearlContent.translatesAutoresizingMaskIntoConstraints = false
        btClearlContent.widthAnchor.constraint(equalToConstant: (view.frame.width/9) - 5).isActive = true
        btClearlContent.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addConstraint(NSLayoutConstraint.init(item: btClearlContent, attribute: .top, relatedBy: .equal, toItem: bt05, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint.init(item: btClearlContent, attribute: .centerX, relatedBy: .equal, toItem: labelResultContent, attribute: .centerX, multiplier: 1, constant: 0))
        


     
        /// here is the constraints to views inside other views
        //label
        labelResultContent.addConstraintsWithFormat(format: "V:|[v0]|", views: labelView)
        labelResultContent.addConstraintsWithFormat(format: "H:|[v0]|", views: labelView)
        //0
        bt00Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt00)
        bt00Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt00)

        //1
        bt01Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt01)
        bt01Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt01)

        //2
        bt02Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt02)
        bt02Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt02)

        //3
        bt03Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt03)
        bt03Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt03)

        //4
        bt04Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt04)
        bt04Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt04)

        //5
        bt05Content.addConstraintsWithFormat(format: "V:|[v0]|", views: bt05)
        bt05Content.addConstraintsWithFormat(format: "H:|[v0]|", views: bt05)

        //+
        btmaisContent.addConstraintsWithFormat(format: "V:|[v0]|", views: btmais)
        btmaisContent.addConstraintsWithFormat(format: "H:|[v0]|", views: btmais)

        //-
        btmenosContent.addConstraintsWithFormat(format: "V:|[v0]|", views: btmenos)
        btmenosContent.addConstraintsWithFormat(format: "H:|[v0]|", views: btmenos)

        //=
        btigualContent.addConstraintsWithFormat(format: "V:|[v0]|", views: btigual)
        btigualContent.addConstraintsWithFormat(format: "H:|[v0]|", views: btigual)
        
        //clear
        btClearlContent.addConstraintsWithFormat(format: "V:|[v0]|", views: btclear)
        btClearlContent.addConstraintsWithFormat(format: "H:|[v0]|", views: btclear)

        myAccViews.append(labelResultContent)
    
        myAccViews.append(bt00Content)
        myAccViews.append(bt01Content)
        myAccViews.append(btmaisContent)

        myAccViews.append(bt02Content)
        myAccViews.append(bt03Content)
        myAccViews.append(btmenosContent)
        
        myAccViews.append(bt04Content)
        myAccViews.append(bt05Content)
        myAccViews.append(btigualContent)

        myAccViews.append(btClearlContent)

        
    }
    
    func testSwitchCase(number : Int) {
        let last = self.labelView.text?.last
        if labelView.text!.count == 1  {
            switch last! {
            case "0":
                self.labelView.text = "\(number)"
                break;
            default :
                self.labelView.text?.append("\(number)")
                break;
            }} else {
                switch last! {
                case "=":
                    break;
                default :
                    self.labelView.text?.append("\(number)")
                    break;
            }
        }
    }
    
    @objc override public func callAction(_ sender: UITapGestureRecognizer) {
        //received action and ask what the kind of selected View
        // entro na view q está selecionada com o 'selected view number' e verifico se ela tem um botão

        for i in 0..<myAccViews.count {
            if myAccViews[i].isSelected{
                selectedViewNumber = i
            }
        }
            for view in myAccViews[selectedViewNumber].subviews {
                if view.isKind(of: UIButton.self){
                    let button = view as! UIButton
                    guard let string = button.titleLabel?.text! else {
                            return
                    }
                    
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                        button.alpha = 0.5
                    }, completion: nil)
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut , animations: {
                        button.alpha = 1
                    }, completion: nil)
                    
                    switch string {
                    case "0":
                        if  self.labelView.text != "0" && self.labelView.text?.last! != "+" && self.labelView.text?.last! != "-" && self.labelView.text?.last! != "=" {
                            self.labelView.text?.append("0")
                        }
                        break;
                    case "1":
                       testSwitchCase(number: 1)
                        break;
                    case "2":
                      testSwitchCase(number: 2)
                        break;
                    case "3":
                       testSwitchCase(number: 3)
                        break;
                    case "4":
                        testSwitchCase(number: 4)
                        break;
                    case "5":
                       testSwitchCase(number: 5)
                        break;
                    case "-":
                        if self.labelView.text != "0" && self.labelView.text?.last! != "+" && self.labelView.text?.last! != "-" && self.labelView.text?.last! != "=" {
                            self.labelView.text?.append("-")
                        }
                        
                        break;
                    case "+":
                        if self.labelView.text != "0" && self.labelView.text?.last! != "+" && self.labelView.text?.last! != "-" && self.labelView.text?.last! != "=" {
                            self.labelView.text?.append("+")
                        }
                        break;
                    case "=":
                        if self.labelView.text != "0" && self.labelView.text?.last! != "+" && self.labelView.text?.last! != "-" && self.labelView.text?.last! != "=" && labelView.text!.count > 1 {

                            var result = Int()
                            var number = String()
                            
                            for char in self.labelView.text! {
                                if char != "-" && char != "+" {
                                    number.append(char)
                                } else  if number.count > 0{
                                    if char == "+" {
                                        result += Int(number)!
                                        number = ""
                                    
                                    } else {
                                        result += Int(number)!
                                        number = "-"
                                    }
                                }
                            }
                            result += Int(number)!
                            
                           
                            self.labelView.text = "\(result)"
                        }
                        break;
                    default :
                        self.labelView.text = "0"
                        break
                    }
                labelResultContent.changeAccLabel(label: "Result: \(self.labelView.text!)")
                }
                
            }
            
        }
}

public extension CalculatorViewController {
    public class func instantiateFromStoryboard() -> CalculatorViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController
        
        return viewController
    }
}
