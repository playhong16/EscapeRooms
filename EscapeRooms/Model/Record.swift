//
//  Record.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/12.
//

import UIKit
import CoreData

// MARK: -

@objc(Record)
public class Record: NSManagedObject {

}

// MARK: - Extension

extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "EscapeRooms")
    }

    @NSManaged public var themeImage: UIImage
    @NSManaged public var photo: UIImage?
    @NSManaged public var date: Date?
    @NSManaged public var result: Bool
    @NSManaged public var escapeTime: String
    @NSManaged public var text: String?

    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}
