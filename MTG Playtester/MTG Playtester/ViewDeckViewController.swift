//
//  ViewDeckViewController.swift
//  MTG Playtester
//
//  Created by dkehres on 4/19/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import UIKit
import Firebase

class ViewDeckViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference!
    var cardNames = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cardImage: UIImageView!
    
    var testDeck: DeckBuilder!
    //@IBOutlet weak var tableView: UITableView!
    //var cardNames = [String]()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UICell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = cardNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
        
        print(currentCell.textLabel!.text!)
        
        let name: String = currentCell.textLabel!.text!
        //        let quantity: String = cardQuantity.text!
        
        //        print("Card: "+name)
        //        print("Quantity: "+quantity)
        
        self.testDeck.searchCard(cardName: name) {
            image in
            DispatchQueue.main.async {
                self.cardImage.image = image
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Get the data within the Cards subtree for a specific deck in Firebase
        self.ref.child("Cards").child("Test Deck").observeSingleEvent(of: .value, with: { (snapshot) in
            //Retrieve data as NSDictionary
            if let value = snapshot.value as? NSDictionary {
                for (_, cardsName) in value {
                    print(cardsName)
                    self.cardNames.append(cardsName as! String)
                }
                self.tableView.reloadData()
            }
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundImage)
        tableView.delegate = self;
        tableView.dataSource = self;
        testDeck = DeckBuilder()
        self.navigationItem.title = "This Deck"
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
