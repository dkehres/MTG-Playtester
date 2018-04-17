//
//  ViewController.swift
//  MTG Playtester
//
//  Created by dkehres on 2/8/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBAction func MainViewControllerUnwindFunction(_ segue: UIStoryboardSegue){
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

