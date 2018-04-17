//
//  PlaytesterViewController.swift
//  MTG Playtester
//
//  Created by dkehres on 2/8/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import Foundation
import UIKit

class PlaytesterViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func PlaytesterViewControllerUnwindFunction(_ segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundImage)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
