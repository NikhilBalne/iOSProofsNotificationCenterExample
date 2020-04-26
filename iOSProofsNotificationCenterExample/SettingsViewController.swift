//
//  SettingsViewController.swift
//  iOSProofsNotificationCenterExample
//
//  Created by Nikhil Balne on 26/04/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

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
    
    @IBAction func themeChangeButtonTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            var color : UIColor!
            if button.tag == 101 {
                print("Red")
                color = .red
            }else if button.tag == 102 {
                print("Green")
                color = .green
            }else{
                print("Blue")
                color = .blue
            }
            NotificationCenter.default.post(name: NSNotification.Name("kColorChangeNotification"), object:color)
        }
    }
}
