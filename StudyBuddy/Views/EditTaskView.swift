//
//  EditTaskView.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var course: Course
    @ObservedObject private var task: Task
    @State private var taskName: String = ""
    @State private var dueDate: Date = Date()
    @State private var dueTime: Date = Date()
    @State var updater: Bool = false
    
    init(course: Course, task: Task) {
        self.course = course
        self.task = task
    }
    
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea(.all)
            
            VStack {
                Text("Editing \(task.wrappedTaskName)")
                Section(header: Text("Enter new task name: ")) {
                    TextField("name", text: $taskName).textFieldStyle(.roundedBorder)
                }
                .frame(width: 300.0, height: 50.0)


                DatePicker(selection: $dueDate, displayedComponents: .date) {
                    Text("Select a new date")
                }
                DatePicker(selection: $dueTime, displayedComponents: .hourAndMinute) {
                    Text("Select Time")
                }
              
                Section {
                    Button("Submit") {
                        CourseAction().editTask(course: course, oldTask: task, taskName: taskName, dueDate: dueDate, dueTime: dueTime, context: managedObjContext)
                        dismiss()
                    }
                    .padding()
                    .buttonStyle(.plain)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                }
            }
            .padding(.top, -200)
        }
    }
}
