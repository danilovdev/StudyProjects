//
//  UIViewCOntrollerExtensions.swift
//  Combinestagram
//
//  Created by Alexey Danilov on 12.06.2018.
//  Copyright © 2018 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    
    func showAlert(title: String, message: String?) -> Observable<Void> {
        return Observable<Void>.create({ [weak self] observer in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
                observer.on(.completed)
            }))
            self?.present(alert, animated: true, completion: nil)
            return Disposables.create {
                self?.dismiss(animated: true, completion: nil)
            }
        })
    }
}



