//
//  UIWindow+Extension.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-26.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
                  return nil
              }
        return window
    }
}
