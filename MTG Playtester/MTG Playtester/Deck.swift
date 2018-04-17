//
//  Deck.swift
//  MTG Playtester
//
//  Created by dkehres on 3/20/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import Foundation
import MTGSDKSwift

public class Deck: LinkedList<Card>{
    
    var deckName: String
    var deckList: LinkedList<Card>?
    var size: Int
    var format: String
    var colors: [String]?
    
    public override init()
{
    deckName = ""
    size = 0
    format = ""
    colors = nil
}
    
    public init(name:String, deckFormat:String, deckColors: [String])
    {
        deckName = name
        deckList = nil
        size = 0
        format = deckFormat
        colors = deckColors
    }
    
    public func remove(_ node: Card)
    {
       if(!isEmpty)
       {
        var tempNode = front
        
        while(node.name != tempNode?.value.name)
        {
            
        }
        }
    }
}
