//
//  File.swift
//  MTG Playtester
//
//  Created by dkehres on 2/8/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ViewEditDecksController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   // UITableViewDelegate, UITableViewSource
    
    var ref: DatabaseReference!
    var deckNames = [String]()
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func ViewEditDecksViewControllerUnwindFunction(_ segue: UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deckNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UICell", for: indexPath) as UITableViewCell
//        let deckNames: [String] = ["Derevi, Infinite Tactitian", "Karador Kombo", "Temur Miracle Grow","Eternal Venom","Omnath Elemental Dudes"]
//
//
        cell.textLabel?.text = deckNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
        
        print(currentCell.textLabel!.text!)
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Get the data within the Decks subtree in Firebase
        self.ref.child("Decks").observeSingleEvent(of: .value, with: { (snapshot) in
            //Retrieve data as NSDictionary
            if let value = snapshot.value as? NSDictionary {
                for (_, deckName) in value {
                    print(deckName)
                    self.deckNames.append(deckName as! String)
                }
                self.tableView.reloadData()
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.sendSubview(toBack: backgroundImage)
        tableView.delegate = self;
        tableView.dataSource = self;
        ref = Database.database().reference()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
