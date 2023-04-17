//
//  RecordData+CoreDataProperties.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/13.
//
//

import Foundation
import CoreData


extension RecordData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecordData> {
        return NSFetchRequest<RecordData>(entityName: "RecordData")
    }
    
    // 확장에서는 저장 속성을 만들 수 없다. 알지? 계산 속성이라고 생각해야함.
    @NSManaged public var date: Date?
    @NSManaged public var escapeTime: String?
    @NSManaged public var result: Bool
    @NSManaged public var text: String?

}

extension RecordData : Identifiable {

}
