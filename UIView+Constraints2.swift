//
//  UIView+Constraints.swift
//  iBeteApp
//
//  Created by Luiz Araujo on 16/10/21.
//

import UIKit



extension UIView {
    
    /**
    Returns a collection of constraints to anchor the bounds of
     the current view to the given view. Constraining a view to its superview.
    - Parameters:
        - view: The view to anchor to.
    - Returns: a collection of constraints to anchor
            the bounds of the current view to the given view.
    */
    func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }
    
    
    /**
     Receives CGFLOAT, can be a 0 (zero) or any value that you might need to set the especific constraint.
     If you need a relationship a little bit different, topAnchor of some View and bottomAnchor of another view, should use the conventional way
       - Parameters:
             - view:
             - centerXAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - centerYAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - topAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - leadingAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - leftAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - bottomAnchor: need some kind of View and a CGFloat, 0 and negative number are allowed;
             - trailingAnchor: need some kind of View and a CGFloat, maybe you should insert a Negative Number
             - rightAnchor: need some kind of View and a CGFloat, maybe you should insert a Negative Number
             - widthAnchor: a CGFloat, doesn't need a View
             - heightAnchor: a CGFloat, doesn't need a View
             - firstBaselineAnchor: TODO
             - lastBaselineAnchor:  TODO
       - Returns: a collection" of constraints.
    */
    func addConstraintAndConstant(with view: UIView? = nil,
                                  centerX: CGFloat? = nil, centerY: CGFloat? = nil,
                                  top: CGFloat? = nil, bottom: CGFloat? = nil,
                                  leading: CGFloat? = nil, left: CGFloat? = nil,
                                  trailing: CGFloat? = nil, right: CGFloat? = nil,
                                  width: CGFloat? = nil, height: CGFloat? = nil
//                                  firstBaseline: CGFloat? = nil, lastBaseline: CGFloat? = nil
                                ) {
        var countConstraintAdded: Int = 0
        
        if translatesAutoresizingMaskIntoConstraints != false{
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let viewArgs = view {
            if let centerXArgs = centerX {
                centerXAnchor.constraint(equalTo: viewArgs.centerXAnchor, constant: centerXArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let centerYArgs = centerY {
                centerYAnchor.constraint(equalTo: viewArgs.centerYAnchor, constant: centerYArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let topArgs = top {
                topAnchor.constraint(equalTo: viewArgs.topAnchor, constant: topArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let bottomArgs = bottom {
                bottomAnchor.constraint(equalTo: viewArgs.bottomAnchor, constant: bottomArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let leadingArgs = leading {
                leadingAnchor.constraint(equalTo: viewArgs.leadingAnchor, constant: leadingArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let leftArgs = left {
                leftAnchor.constraint(equalTo: viewArgs.leftAnchor, constant: leftArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let trailingArgs = trailing {
                trailingAnchor.constraint(equalTo: viewArgs.trailingAnchor, constant: trailingArgs).isActive = true
                countConstraintAdded += 1
            }
            
            if let rightArgs = right {
                rightAnchor.constraint(equalTo: viewArgs.rightAnchor, constant: rightArgs).isActive = true
                countConstraintAdded += 1
            }
            
            //Check if there is a constraint and a view in the parameters
            if countConstraintAdded == 0{
                print("\tError! \nYou passed some kind of View, but you should also\npass at least one type of constraint.")
                return
            }
            
        } else {
            if (centerX != nil || centerY != nil || top != nil || bottom != nil || leading != nil || left != nil || trailing != nil || right != nil) {
                print("\tError! \nYou passed a kind of Constraintt, \nbut you should also pass a View.")
                return
            }
        }
        
        if let widthArgs = width {
            widthAnchor.constraint(equalToConstant: widthArgs).isActive = true
            countConstraintAdded += 1
        }
        
        if let heightArgs = height {
            heightAnchor.constraint(equalToConstant: heightArgs).isActive = true
            countConstraintAdded += 1
        }
        
//        if let firstBaseline = firstBaselineArgs {
//            firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor, constant: firstBaseline).isActive = true
//        }
//
//        if let lastBaseline = lastBaselineArgs {
//            lastBaselineAnchor.constraint(equalTo: view.lastBaselineAnchor, constant: lastBaseline).isActive = true
//        }
        
        //Check if there is a constraint and a view in the parameters
        if countConstraintAdded == 0{
            print("\tError! \nYou got to pass at least one type of constraint and \nmaybe a View, depending on the type of constraint.")
        }
        
    }
    
    
    
    
    //TODO: Do more of the following
    
    @discardableResult
    func align(with view: UIView, constant: CGFloat = 0.0) -> [NSLayoutConstraint] {
      translatesAutoresizingMaskIntoConstraints = false
      let constraints = [
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant),
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
      ]
      NSLayoutConstraint.activate(constraints)
      return constraints
    }

    @discardableResult
    func alignTop(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
      translatesAutoresizingMaskIntoConstraints = false
      let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = isActive
      return constraint
    }
    
    
/*
// Constraint creation conveniences. See NSLayoutAnchor.h for details.
    open var leadingAnchor: NSLayoutXAxisAnchor { get }

    open var trailingAnchor: NSLayoutXAxisAnchor { get }

    open var leftAnchor: NSLayoutXAxisAnchor { get }

    open var rightAnchor: NSLayoutXAxisAnchor { get }

    open var topAnchor: NSLayoutYAxisAnchor { get }

    open var bottomAnchor: NSLayoutYAxisAnchor { get }

    open var widthAnchor: NSLayoutDimension { get }

    open var heightAnchor: NSLayoutDimension { get }

    open var centerXAnchor: NSLayoutXAxisAnchor { get }

    open var centerYAnchor: NSLayoutYAxisAnchor { get }

    open var firstBaselineAnchor: NSLayoutYAxisAnchor { get }

    open var lastBaselineAnchor: NSLayoutYAxisAnchor { get }

 
//Available layout guides
//Each UIView comes with a few layout guides which can also be used as anchors.

     layoutMarginsGuide     : Set constraints and keep the layout margins as spacing
     readableContentGuide   : Constraints the width to a size that is easy for the user to read
     safeAreaLayoutGuide    : Represents the portion of your view that is unobscured by bars and other content

 Ex.:
     let constraints = [
         outerSquare.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor),
         outerSquare.leftAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leftAnchor),
         viewController.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: outerSquare.bottomAnchor),
         viewController.view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: outerSquare.rightAnchor)
     ]
     NSLayoutConstraint.activate(constraints)

 Supporting Right-to-Left languages
 Although it might seem really obvious to just use leftAnchor and rightAnchor, you might want to think about using leadingAnchor and trailingAnchor instead. Doing so adds support for Right-to-Left languages to your views. This is mostly important for views like labels in which you want to make sure that they get flipped for Right-to-Left languages.
 
 
 
 
 
 
 #Performance
 - Constraint churn:
    - Avoid removing all constraints
    - Add static once
    - Only change the constraints that need changing
    - Hide view instead of removing it
 
 */


}

extension NSLayoutConstraint {
    
    /// Returns the constraint sender with the passed priority.
    ///
    /// - Parameter priority: The priority to be set.
    /// - Returns: The sended constraint adjusted with the new priority.
    func usingPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UILayoutPriority {
    
    /// Creates a priority which is almost required, but not 100%.
    static var almostRequired: UILayoutPriority {
        return UILayoutPriority(rawValue: 999)
    }
    
    /// Creates a priority which is not required at all.
    static var notRequired: UILayoutPriority {
        return UILayoutPriority(rawValue: 0)
    }
}

//TODO: Make it work... Is it necessary?
/**
An Auto Layout Property Wrapper
Prevent yourself from constantly writing:
```
translatesAutoresizingMaskIntoConstraints = false
```
 */
//@propertyWrapper
//public struct UsesAutoLayout<T: UIView> {
//    public var wrappedValue: T {
//        didSet {
//            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//
//    public init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//    }
//}
//
//final class MyViewController {
//    @UsesAutoLayout
//    var label = UILabel()
//}
