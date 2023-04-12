//
//  EditCourseView.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//

import SwiftUI

struct EditCourseView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var course: Course
    @State private var courseName = ""
    @State var refresh: Bool = false
    
    init(course: Course) {
        self.course = course
    }
    
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea(.all)
            
            VStack {
                Section(header: Text("Enter new course name: ")) {
                    TextField("name", text: $courseName).textFieldStyle(.roundedBorder)
                }
                .frame(width: 300.0, height: 50.0)
              
                Section {
                    Button("Submit") {
                        CourseAction().editCourse(course: course, courseName: courseName, context: managedObjContext)
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
