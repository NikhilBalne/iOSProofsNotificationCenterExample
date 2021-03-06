//
//  ViewController.swift
//  iOSProofsNotificationCenterExample
//
//  Created by Nikhil Balne on 26/04/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeToThemeChange()
    }

    func subscribeToThemeChange(){
        NotificationCenter.default.addObserver(self, selector: #selector(colorChange(notification:)), name: NSNotification.Name("kColorChangeNotification"), object: nil)
    }

    @objc func colorChange(notification:Notification){
        if let color = notification.object as? UIColor {
            self.view.backgroundColor = color
        }
    }
    
}

