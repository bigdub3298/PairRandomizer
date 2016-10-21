//
//  PersonController.swift
//  PairRandomizer
//
//  Created by Wesley Austin on 10/20/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    static let sharedController = PersonController()
    
    // Create
    func addPerson(name: String) {
        let _ = Person(name: name)
        
        Stack.saveToPersistentStore()
    }
    
    // Read
    var people: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.fetch(request)
        } catch {
            return []
        }
    }
    
    // Update
    func updatePerson(person: Person, name: String) {
        person.name = name
        
        Stack.saveToPersistentStore()
    }
    
    // Delete
    func removePerson(person: Person) {
        if let moc = person.managedObjectContext {
            moc.delete(person)
            Stack.saveToPersistentStore()
        }
    }
}
