//
//  Course+CoreDataProperties.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension Course {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)
    
    public var wrappedCourseName: String {
        courseName ?? "Invalid Course"
    }
    public var taskArray: [Task] {
        let set = tasks as? Set<Task> ?? []
        
        return set.sorted {
            $0.dueDate ?? Date.now < $1.dueDate ?? Date.now
        }
    }
}

extension Course : Identifiable {

}
