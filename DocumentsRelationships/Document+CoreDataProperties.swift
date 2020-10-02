//
//  Document+CoreDataProperties.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var content: String?
    @NSManaged public var category: Category?

}
