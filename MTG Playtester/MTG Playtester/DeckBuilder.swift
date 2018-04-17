//
//  DeckBuilder.swift
//  MTG Playtester
//
//  Created by dkehres on 3/6/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import Foundation
import MTGSDKSwift

class DeckBuilder{
    
//    public Deck(name: String, format: String){
//        deckName: String = name
//        deckFormat: String = format
//    }
    
    var cards: [Card]?
    var image: UIImage?
    var deck: Deck?
    let magic: Magic!
    
    public init(){
        magic = Magic()
        cards = nil
        image = nil
        deck = Deck()
    }
    
    func buildDeck(){
        print("Building deck...")
        
        let color = CardSearchParameter(parameterType: .colors, value: "blue")
        let cmc = CardSearchParameter(parameterType: .cmc, value: "2")
        let setCode = CardSearchParameter(parameterType: .set, value: "AER")
        
        magic.fetchCards([color,cmc,setCode]) {
            cards, error in
            print("Fetching cards...")
            if let error = error {
                print("Error detected...")
                //handle your error
            }
            
            self.cards = cards
            
            for c in self.cards! {
                print(c.name!)
            }
            
        }
    }
    
    func addCard(cardName: String){
        magic.fetchPageSize = "1"
        magic.fetchPageTotal = "1"
        
        print("Building deck...")

        let name = CardSearchParameter(parameterType: .name, value: cardName)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.magic.fetchCards([name]) {
                cards, error in
                print("Fetching cards...")
                if let error = error {
                    print("Error detected...", error)
                    //handle your error
                    return
                }
                
                if let cards = cards {
                    self.magic.fetchCards([name]){
                        cards, error in
                        let cardNode: LinkedList.LinkedListNode<Card> = LinkedList<Card>.LinkedListNode(value: cards![0])
                        print("Card Node: ",cardNode.value.name!)
                        self.deck?.addToFront(cardNode)
                    }
                }
            }
        }

//        self.deck.deckList.toString()

    }
    
    func searchCard(cardName: String, callback: @escaping ((_ image: UIImage?)->())) {
        print("Building deck...")
        
        let name = CardSearchParameter(parameterType: .name, value: cardName)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.magic.fetchCards([name]) {
                cards, error in
                print("Fetching cards...")
                if let error = error {
                    print("Error detected...", error)
                    //handle your error
                    callback(nil)
                    return
                }
                
                if let cards = cards {
                    self.magic.fetchImageForCard(cards.first!){
                        image, error in
                        self.image = image
                        callback(image)
                    }
                }
            }
        }
    }
    func getImage() {
        magic.fetchImageForCard(self.cards!.first!) {
            image, error in
            
            self.image = image
            
            assert(self.image != nil)
            
        }
        
    }
}
