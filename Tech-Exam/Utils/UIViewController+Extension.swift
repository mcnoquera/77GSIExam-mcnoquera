//
//  UIViewController+Extension.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/12/24.
//

import UIKit

extension UIViewController {
    
    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {

        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    static var activityIndicatorTag = 12345

        func startLoading() {
            stopLoading()
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator.tag = UIViewController.activityIndicatorTag
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = .large

            DispatchQueue.main.async {
                self.view.addSubview(activityIndicator)
                activityIndicator.startAnimating()
            }
        }

        func stopLoading() {
            let activityIndicator = view.viewWithTag(UIViewController.activityIndicatorTag) as? UIActivityIndicatorView
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
                activityIndicator?.removeFromSuperview()
            }
        }
}
