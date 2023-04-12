//
//  ContentView.swift
//  StudyBuddy
//
//  Created by valentina on 2023-03-29.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var courses : FetchedResults<Course>
    @State private var animation : Bool = true
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    NavigationLink(destination: AddCourseView(), label: { Text("+") })
                    List {
                        ForEach(courses, id: \.self) { course in
                            NavigationLink(destination: TaskView(course: course), label: { Text("\(course.wrappedCourseName)")})
                            NavigationLink(destination: EditCourseView(course: course), label: { Text("Edit") })
                        }
                        .onDelete(perform: deleteCourse)
                    }

                    Button("DELTE ALL") {
                        // Configure Fetch Request

                        do {
                            for course in courses {
                                managedObjContext.delete(course)
                            }

                            // Save Changes
                            try managedObjContext.save()

                        } catch {
                            // Error Handling
                            // ...
                        }
                    }
                }
            }
        }
        .padding()
    }
    func deleteCourse(offsets: IndexSet) {
        self.animation = false
        withAnimation {
            offsets.map { courses[$0] }
                .forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
