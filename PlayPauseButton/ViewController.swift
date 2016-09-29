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
        
        self.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.button.center = view.center
        self.button.addTarget(self, action: #selector(ViewController.toggle(_:)), for:.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle  {
        return .lightContent
    }
    
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }
}
