//
//  DeckEditorViewController.swift
//  MTG Playtester
//
//  Created by dkehres on 2/13/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import UIKit
import MTGSDKSwift
import Firebase

class DeckEditorViewController: UIViewController {

    var testDeck: DeckBuilder!
    var ref: DatabaseReference!
    
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardQuantity: UITextField!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundImage)
        testDeck = DeckBuilder()
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCard(_ sender: Any) {
        let name: String = cardName.text!
        let quantity: String = cardQuantity.text!

//        print("Card: "+name)
//        print("Quantity: "+quantity)
        
        self.testDeck.addCard(cardName: name)
        
       /* print("First card: ",testDeck.deck?.first?.value.name!)
        print("Last card: ",testDeck.deck?.rear?.value.name!)*/
        
        //Add card to Database
   
        let deckName = "Test"
        self.ref.child("Decks").observeSingleEvent(of: .value, with: { (snapshot) in
            
            //Loop through all children of Decks
            for childSnap in snapshot.children.allObjects {
                let snap = childSnap as! DataSnapshot
                //Retrieve data as NSDictionary
                if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key] as? NSString{
                    //Check to see if we are working with the Deck the user wants to edit
                    if(snapVal as String == deckName)
                    {
                        //Add card name under the appropriate deck on Firebase (Incomplete)
                        self.ref.child("Decks").child(snapVal as String).child("Cards").childByAutoId().setValue(self.testDeck.deck?.first?.value.name!)
                    }
                }
            }
        })
    self.ref.child("Decks").child("Cards").childByAutoId().setValue(testDeck.deck?.first?.value.name!)
    }
    
    
    @IBAction func searchCard(_ sender: UIButton) {
        let name: String = cardName.text!
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
