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
 Now, how we know it's important,
 
 we can turn off the accessibility test.
 Change the parameter `isActive` to false.
 */
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
//#-code-completion(everything, hide)


//#-code-completion(literal, show, boolean)
//#-code-completion(identifier, show, testAccessibility())


//#-end-hidden-code
//#-editable-code
testAccessibility(isActive : true)
//#-end-editable-code
/*:
 Run the code now!\
 As you can see, It's a calculator. Now you are able to change those labels.
 
 * Callout(Important to know):This function is **exclusive** of this playground, don't try to do this in real code.
In real code, you could use screen curtain when you are using voice over and tap twice with three fingers on screen.
 
 In Xcode when you click in any view and in the view's identity inspector, you will see the options to change the accessibility label. Here is a screenshot of it:
 
 ![showing the inspector](inspector.png)\
 \
 [please click here to go to the next page.](@next)
 */










