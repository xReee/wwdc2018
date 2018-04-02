//#-hidden-code
//  wwdcRenata
//
//  Created by RenataFaria on 27/03/18.
//  Copyright © 2018 RenataFaria. All rights reserved.
//
//#-end-hidden-code
//#-hidden-code
//#-end-hidden-code
/*:
 ## Testing a non accessible app
 
 The most part of the apps aren't accessible, making the interface confusing for people with low vision or blindness. Do you have any ideia how does it feels like? If the anwser is 'no' **run this code** and use a non acessible app in those people's perspective.
 Because of the gestures the app navigation is easy, but all the labels are confusing and you can't use it, actually, you even can't at least identify what's the app about.
 That's why we are going to implement accessibility on it.
 
 [please click here to go to the next page.](@next)
 
 */
//#-end-hidden-code
//#-hidden-code

import PlaygroundSupport
let viewController = CalculatorViewController.instantiateFromStoryboard()
PlaygroundPage.current.liveView = viewController


enum viewsList {
    case bt0
    case bt1
    case bt2
    case bt3
    case bt4
    case bt5
    case btMinus
    case btPlus
    case btEqual
    case btClear
    case labelResult
    
    static let allValues = [bt0, bt1, bt2, bt3, bt4, bt5, btMinus, btPlus, btEqual, btClear, labelResult]
}

func testAccessibility(isActive : Bool) {
    viewController.cortina(isActive: isActive)
}
func changeAccLabel(button : viewsList, newLabel: String) {
    switch button {
    case .bt0:
        viewController.changeAccLabel(tag: 1, newLabel: newLabel)
    case .bt1:
        viewController.changeAccLabel(tag: 2, newLabel: newLabel)
    case .bt2:
        viewController.changeAccLabel(tag: 4, newLabel: newLabel)
    case .bt3:
        viewController.changeAccLabel(tag: 5, newLabel: newLabel)
    case .bt4:
        viewController.changeAccLabel(tag: 7, newLabel: newLabel)
    case .bt5:
        viewController.changeAccLabel(tag: 8, newLabel: newLabel)
    case .btMinus:
        viewController.changeAccLabel(tag: 6, newLabel: newLabel)
    case .btPlus:
        viewController.changeAccLabel(tag: 3, newLabel: newLabel)
    case .btEqual:
        viewController.changeAccLabel(tag: 9, newLabel: newLabel)
    case .btClear:
        viewController.changeAccLabel(tag: 10, newLabel: newLabel)
    case .labelResult:
        viewController.changeAccLabel(tag: 0, newLabel: newLabel)
    default:
        return
    }
    
}
testAccessibility(isActive : true)

//#-code-completion(identifier, hide, viewController)





//cortina(isActive: false)

//#-end-hidden-code









