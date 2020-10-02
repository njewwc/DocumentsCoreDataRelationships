//
//  Document+CoreDataClass.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {

    convenience init?(name: String,content:String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Document.entity(),insertInto: context)
        
        self.name = name
        self.content = content
    }
    
}
