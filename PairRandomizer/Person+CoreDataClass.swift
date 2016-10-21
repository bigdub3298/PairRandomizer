//
//  Person+CoreDataClass.swift
//  PairRandomizer
//
//  Created by Wesley Austin on 10/20/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import Foundation
import CoreData


public class Person: NSManagedObject {
    
    convenience init(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        self.init(context: context)
        
        self.name = name
    }
}
