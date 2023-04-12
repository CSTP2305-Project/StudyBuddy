//
//  AddCourseView.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-30.
//

import SwiftUI

struct AddCourseView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var courseName = ""
    
    @State var refresh: Bool = false
    
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea(.all)
            
            VStack {
                Section(header: Text("Enter a course name: ")) {
                    TextField("name", text: $courseName).textFieldStyle(.roundedBorder)
                }
                .frame(width: 300.0, height: 50.0)
              
                Section {
                    Button("Submit") {
                        CourseAction().addCourse(courseName: courseName, context: managedObjContext)
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

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
