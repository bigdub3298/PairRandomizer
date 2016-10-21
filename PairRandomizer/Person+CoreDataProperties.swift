//
//  Person+CoreDataProperties.swift
//  PairRandomizer
//
//  Created by Wesley Austin on 10/20/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?

}
