//
//  Extensions.swift
//  TesteWWDC18
//
//  Created by Renata on 16/03/18.
//  Copyright © 2018 Renata. All rights reserved.
//

import UIKit

extension UIView{
    public func addConstraintsWithFormat(format: String, views: UIView... ){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255 , green:  green/255, blue:  blue/255, alpha: 1)
    }
}

