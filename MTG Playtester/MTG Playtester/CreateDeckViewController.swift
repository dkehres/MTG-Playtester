//
//  CreateDeckViewController.swift
//  MTG Playtester
//
//  Created by dkehres on 3/27/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import UIKit
import Firebase

class CreateDeckViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let formatPickerValues = ["Standard", "Modern", "Legacy", "Commander/EDH"]
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var deckName: UITextField!
    @IBOutlet weak var deckFormat: UITextField!
    var formatPicker: UIPickerView!
    
    var ref: DatabaseReference!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func createDeck(_ sender: Any) {
        self.ref.child("Decks").childByAutoId().setValue(deckName.text)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return formatPickerValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return formatPickerValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        deckFormat.text = formatPickerValues[row]
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundImage)
        
        formatPicker = UIPickerView()
        
        formatPicker.dataSource = self
        formatPicker.delegate = self
        
        deckFormat.inputView = formatPicker
        deckFormat.text = formatPickerValues[0]
        
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
