//
//  Stack.swift
//  PairRandomizer
//
//  Created by Wesley Austin on 10/20/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    static let sharedStack = Stack()
    
    lazy var managedObjectContext = Stack.setUpMainContext()
    
    static func setUpMainContext() -> NSManagedObjectContext {
        let bundle = Bundle.main
        
        guard let model = NSManagedObjectModel.mergedModel(from: [bundle]) else { fatalError("Model not found") }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        try! psc.addPersistentStore(ofType: NSSQLiteStoreType,
                                    configurationName: nil,
                                    at: storeURL(),
                                    options: [NSMigratePersistentStoresAutomaticallyOption: true, NSInferredMappingModelError: true])
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        return context
    }
    
    static func storeURL() -> URL? {
        let documentDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        return documentDirectory?.appendingPathComponent("db.sqlite")
    }
    
    static func saveToPersistentStore() {
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Manage Object Model. Items not saved.")
        }
    }
}
