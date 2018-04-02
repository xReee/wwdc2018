//#-hidden-code
//  wwdcRenata
//
//  Created by RenataFaria on 23/03/18.
//  Copyright © 2018 RenataFaria. All rights reserved.
//
//#-end-hidden-code
//#-hidden-code
//#-end-hidden-code
/*:
 ## Applying Accessibility Labels
As you can see, we can't use any inspector here, that's why we are going to change all labels programmatically. You can use this same code in your real project! */
//#-hidden-code
import PlaygroundSupport
let viewController = CalculatorViewController.instantiateFromStoryboard()
PlaygroundPage.current.liveView = viewController

enum view  {
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
    
    
    var accessibilityLabel: String {
        get {
            return ""
        }
        nonmutating set {
            self.addAccessibilityLabel(newValue)
        }
    }
    
    private func addAccessibilityLabel(_ newLabel: String) {
        switch self {
        case .bt0:
            viewController.changeAccLabel(tag: 1, newLabel: newLabel)
            break
        case .bt1:
            viewController.changeAccLabel(tag: 2, newLabel: newLabel)
            break
        case .bt2:
            viewController.changeAccLabel(tag: 4, newLabel: newLabel)
            break
        case .bt3:
            viewController.changeAccLabel(tag: 5, newLabel: newLabel)
            break
        case .bt4:
            viewController.changeAccLabel(tag: 7, newLabel: newLabel)
            break
        case .bt5:
            viewController.changeAccLabel(tag: 8, newLabel: newLabel)
            break
        case .btMinus:
            viewController.changeAccLabel(tag: 6, newLabel: newLabel)
            break
        case .btPlus:
            viewController.changeAccLabel(tag: 3, newLabel: newLabel)
            break
        case .btEqual:
            viewController.changeAccLabel(tag: 9, newLabel: newLabel)
            break
        case .btClear:
            viewController.changeAccLabel(tag: 10, newLabel: newLabel)
            break
        default:
            viewController.changeAccLabel(tag: 0, newLabel: newLabel)
            break
        }
        
    }
    
    static let allValues = [bt0, bt1, bt2, bt3, bt4, bt5, btMinus, btPlus, btEqual, btClear, labelResult]
}

func testAccessibility(isActive : Bool) {
    viewController.cortina(isActive: isActive)
}

func resultContent() -> String{
    return viewController.resultContent()
}
view.labelResult.accessibilityLabel = "Result: zero"
//func changeAccLabel(button : mainView, newLabel: String) {
//
//}

//#-end-hidden-code
//#-editable-code
/*:
To change the accessibility labels  you will use:
 - Example:
 `view.subviewName.accessibilityLabel = "textHere"`
 */

// I did the number zero for you:
view.bt0.accessibilityLabel = "button zero"
//now it's your turn:
//Numbers
view.bt1.accessibilityLabel = "UIButton"
view.bt2.accessibilityLabel = "UIButton"
view.bt3.accessibilityLabel = "UIButton"
view.bt4.accessibilityLabel = "UIButton"
view.bt5.accessibilityLabel = "UIButton"
//Others
view.btPlus.accessibilityLabel = "UIButton"
view.btMinus.accessibilityLabel = "UIButton"
view.btEqual.accessibilityLabel = "UIButton"
view.btClear.accessibilityLabel = "UIButton"

//use it to test accessibility
testAccessibility(isActive : false)


//#-end-editable-code
/*:
 - Note:
The label result is already implemented, so you don't need to worry about it!
 
 [please click here to go to the next page.](@next)
 */


//#-code-completion(everything, hide)

//#-code-completion(currentmodule, show)
//#-code-completion(literal, show, boolean, string)
//#-code-completion(identifier, hide, viewController)
//#-code-completion(identifier, show, viewsList.allValues)





