//
//  LinkedList.swift
//  MTG Playtester
//
//  Created by mschott on 2/28/18.
//  Copyright © 2018 dkehres. All rights reserved.
//

import Foundation

public class LinkedList<T>{
    
    
    
    //Nodes for the list
    public class LinkedListNode<T>{
        
        //Points to next node
        var next: LinkedListNode?
        //Points to previous node
        var previous: LinkedListNode?
        //Points to last node
        var rear: LinkedListNode?
        //Type value of nodes
        var value: T
        
        //Initialize the type
        public init(value: T) {
            self.value = value
        }
        
    }
    
    //First node of the list
    var front:LinkedListNode<T>?
    //Last node of the list
    var rear:LinkedListNode<T>?
    
    public init(){
        
    }
    
    //Returns front of the list
    public var first:LinkedListNode<T>?
    {
        return front
    }
    
    public var last:LinkedListNode<T>?
    {
        return rear
    }
    
    public var count: Int{
        if(front == nil)
        {
        return 0
        }
        
        var count = 1;
        var node = front;
        
        while let next = node?.next{
            node = next;
            count += 1
        }
        return count
        
    }
    
    //Adds a linked node to the front of the list
    public func addToFront(_ node: LinkedListNode<T>)
    {
        let newNode:LinkedListNode = node
        
        //Checks if there is currently a front
        if let frontNode = front {
            
            //Set front to be the 2nd node in the list
            newNode.next = frontNode;
            
            //Set front's previous to the new node
            frontNode.previous = newNode
            
            //Set the front to the new node
            front = newNode
        } else{
           front = newNode
           rear = newNode
        }
    }
    
    
    //Adds a linked node to the back of the list
    public func addToBack(_ node: LinkedListNode<T>)
    {
        //New node to be added
        let newNode = node
        
        //Checks if rear exists
        if let rearNode = rear {
         
            //Set previous node to the original rear of the list
            newNode.previous = rearNode
            
            //Update the orginal rear of the list's next pointer
            rearNode.next = newNode
        }
        else{
            front = newNode
        }
    }
    
   /* public func insert(_ node: LinkedListNode<T>, index: Int)
    {
        //New node to be added
        let newNode = node
        
        var count = 0
        
        //Check if the list is empty
        if(front == nil)
        {
            front = newNode
            return
        } else {
        var tempNode = front
            
            //Find the node at the specific index
            while count != index
            {
                tempNode = tempNode?.next
                count += 1
            }
            //Set the next node for the newNode to be the node at the index
            newNode.next = tempNode
            
            //Set the newNode's previous node to the indexed node's previous node
            newNode.previous = tempNode?.previous
            
            //Set the indexed nodes previous node's next node to the new node
            tempNode?.previous?.next = newNode
            
            //Set the tempNode's previous node to the newNode
            tempNode?.previous = newNode
        }
        
    }*/
    
   /* public func remove(_ node: LinkedListNode<T>)
    {
        
        var count = 0
        
        if(!isEmpty)
        {
            var tempNode = front
            
            while (count != index)
            {
                tempNode = tempNode?.next
                count += 1
            }
            
            //Assign the previous node's next pointer to the tempNode's next pointer
            tempNode?.previous?.next = tempNode?.next
            
            //Assign the tempNode's previous pointer to the
            tempNode?.next?.previous = tempNode?.previous
            
        }
    }*/
    
    public var isEmpty:Bool
    {
        if (front == nil){
            return true
        }
        else{
            return false
        }
    }
    
    public func toString(){
        //TODO
    }
    
    
    
    
    
    
    
}
