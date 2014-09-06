//
//  ViewController.swift
//  PlayPauseButton
//
//  Created by Jin Wang on 2/09/2014.
//  Copyright (c) 2014 UThoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    var button: PlayPauseButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 38.0 / 255, green: 151.0 / 255, blue: 68.0 / 255, alpha: 1)
        
        self.button = PlayPauseButton(frame: CGRectMake(0, 0, 50, 50))
        self.button.center = view.center
        self.button.addTarget(self, action: "toggle:", forControlEvents:.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle  {
        return .LightContent
    }
    
    func toggle(sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }
}