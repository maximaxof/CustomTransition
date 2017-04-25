//
//  Animator.swift
//  Budget
//
//  Created by Maxime Moison on 3/20/17.
//  Copyright © 2017 Maxime Moison. All rights reserved.
//

import Foundation
import UIKit

class CustomTransition {
    
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let window = UIApplication.shared.keyWindow
    
    // Cover from left
    
    static func coverFromRight(from: UIViewController, to: UIViewController) {
        to.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)          // setup the next controller's frame
        window?.insertSubview(to.view, aboveSubview: from.view)                                         // insert it into the window
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: { () -> Void in // Animate the transition
            from.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            to.view.frame = to.view.frame.offsetBy(dx: -screenWidth, dy: 0)
            from.view.alpha = 0.3
        }, completion: { finished in
            from.present(to, animated: false, completion: nil)                                          // at the end of the animation present the new controller
        })
    }
    
    static func uncoverFromRight(from: UIViewController, to: UIViewController) {
        window?.insertSubview(to.view, at: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            to.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            to.view.alpha = 1
            from.view.frame = from.view.frame.offsetBy(dx: screenWidth, dy: 0)
        }, completion: { finished in
            from.dismiss(animated: false, completion: nil)                                              // at the end dismiss the current controller to return to the previous
        })
    }
    
    // Cover from bottom
    
    static func coverFromBottom(from: UIViewController, to: UIViewController) {
        to.view.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        window?.insertSubview(to.view, aboveSubview: from.view)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            from.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            to.view.frame = to.view.frame.offsetBy(dx: 0, dy: -screenHeight)
            from.view.alpha = 0.3
        }, completion: { finished in
            from.present(to, animated: false, completion: nil)
        })
    }
    
    static func uncoverFromBottom(from: UIViewController, to: UIViewController) {
        window?.insertSubview(to.view, at: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            to.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            to.view.alpha = 1
            from.view.frame = from.view.frame.offsetBy(dx: 0, dy: screenHeight)
            
        }, completion: { finished in
            from.dismiss(animated: false, completion: nil)
        })
    }
    
    // Show side menu
    
    static func showSideMenu(from: UIViewController, to: UIViewController) {
        to.view.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
        window?.insertSubview(to.view, aboveSubview: from.view)
        
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            from.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            to.view.frame = to.view.frame.offsetBy(dx: screenWidth, dy: 0)
            from.view.alpha = 0.3
        }, completion: { finished in
            from.present(to, animated: false, completion: nil)
        })
    }
    
    static func hideSideMenu(from: UIViewController, to: UIViewController) {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            to.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            from.view.frame = from.view.frame.offsetBy(dx: -screenWidth, dy: 0)
            to.view.alpha = 1
        }, completion: { finished in
            from.dismiss(animated: false, completion: nil)
        })
    }
    
    static func switchVC(from: UIViewController, to: UIViewController) {
        to.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        to.view.frame = to.view.frame.offsetBy(dx: -screenWidth, dy: 0)
        to.view.alpha = 0.3
        window?.insertSubview(to.view, at: 0)
        
        let mainView = (from as! MenuVC).parentVC.view
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: { () -> Void in
            from.view.frame = from.view.frame.offsetBy(dx: -screenWidth, dy: 0)
            mainView?.frame = (mainView?.frame.offsetBy(dx: self.screenWidth, dy: 0))!
            to.view.frame = to.view.frame.offsetBy(dx: self.screenWidth, dy: 0)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, animations: {
                to.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                to.view.alpha = 1
            }, completion: { finished in
                from.dismiss(animated: false, completion: nil)          // When switching view controller you have to switch root controller
                window?.rootViewController = to                                 // This is how (:
            })
        })
    }
    
    // Animate deletion
    
    static func animateDeletion(from: UIViewController, to: UIViewController) {
        window?.insertSubview(to.view, at: 0)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            from.view.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
            to.view.alpha = 1
            to.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: { finished in
            from.dismiss(animated: false, completion: nil)
        })
    }
    
    // Popup from bottom
    
    static func popFromBottom(from: UIViewController, to: UIViewController) {
        to.view.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        window?.insertSubview(to.view, aboveSubview: from.view)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            to.view.frame = to.view.frame.offsetBy(dx: 0, dy: -screenHeight)
            from.view.alpha = 0.3
        }, completion: { finished in
            from.present(to, animated: false, completion: nil)
        })
    }
    static func unpopFromBottom(from: UIViewController, to: UIViewController) {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            to.view.alpha = 1
            from.view.frame = from.view.frame.offsetBy(dx: 0, dy: (UIApplication.shared.keyWindow?.frame.height)!)
        }, completion: { finished in
            from.dismiss(animated: false, completion: nil)
        })
    }
    
}
