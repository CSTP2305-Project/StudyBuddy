//
//  TaskView.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//

import SwiftUI

struct TaskView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @State var isShow: Bool = false
    @ObservedObject var course: Course
    @State var tasks: [Task] = [Task]()
    @FetchRequest(sortDescriptors: []) var courses : FetchedResults<Course>
    @State private var animation : Bool = true
    
    
    init(course: Course) {
        self.course = course
        self.tasks = course.taskArray
    }
    var body: some View {
        VStack {
            Text("Viewing Course: \(course.wrappedCourseName)")
            NavigationLink(destination: AddTaskView(course: course), label: { Text("+") })
            VStack {
                List {
                    ForEach(course.taskArray, id: \.self) { task in
                        VStack {
                            HStack {
                                    Text(task.wrappedTaskName)
                                Button("Delete") { deleteTask(task: task) }
                            }
                            HStack {
                                Text(Date.now, format: .dateTime.hour().minute())
                                Text(Date.now, format: .dateTime.day().month().year())
                            }
                        }
                        NavigationLink(destination: EditTaskView(course: course, task: task), label: { Text("Edit") })
                    }
                }
            }
        }
    }
    func deleteTask(task: Task) {
        self.course.removeFromTasks(task)
        
        try? managedObjContext.save()
    }
    func editTask(task: Task) {
        self.course.removeFromTasks(task)
        
        try? managedObjContext.save()
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        Text("This is TaskView_Previews")
//        TaskView(course: course)
    }
}
