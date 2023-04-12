//
//  CourseActions.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//

import SwiftUI
import CoreData

class CourseAction: DataController {
    
    func addCourse(courseName: String, context: NSManagedObjectContext) {
        let course = Course(context: context)
        course.courseName = courseName
        print("Course Name: \(courseName)")
        
        save(context: context)
    }
    
    func editCourse(course: Course, courseName: String, context: NSManagedObjectContext) {
        let course = course
        course.courseName = courseName
        
        save(context: context)
    }
    
    func addTask(course: Course, taskName: String, dueDate: Date, dueTime: Date, context: NSManagedObjectContext) {
        let course = course
        let task = Task(context: context)
        task.taskName = taskName
        task.dueDate = dueDate
        task.dueTime = dueTime
        task.origin = course
        course.addToTasks(task)
        
        save(context: context)
    }
    
    func editTask(course: Course, oldTask: Task, taskName: String, dueDate: Date, dueTime: Date, context: NSManagedObjectContext) {
        let course = course
        course.removeFromTasks(oldTask)
        let task = Task(context: context)
        task.taskName = taskName
        task.dueDate = dueDate
        task.dueTime = dueTime
        
        save(context: context)
    }
}
