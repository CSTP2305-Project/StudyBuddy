//
//  Task+CoreDataProperties.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var dueTime: Date?
    @NSManaged public var origin: Course?

    public var wrappedTaskName: String {
        taskName ?? "Unknown TaskName"
    }
    public var wrappedDueDate: Date {
        dueDate ?? Date.now
    }
    public var wrappedDueTime: Date {
        dueTime ?? Date.now
    }
}

extension Task : Identifiable {

}
