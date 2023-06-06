//
//  DailyTasks.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct DailyTasks: View {
    // Array to hold unfinished tasks
    @State private var unfinishedTasks: [Task] = [
        Task(name: "Task 1", isSelected: false),
        Task(name: "Task 2", isSelected: false),
        Task(name: "Task 3", isSelected: false),
        Task(name: "Task 4", isSelected: false)
    ]
    
    // Array to hold completed tasks
    @State private var completedTasks: [Task] = []

    
    var body: some View {
        //  ScrollView {
              VStack {
                  // Loop through unfinished tasks
                  ForEach(unfinishedTasks) { task in
                      // Display the rectangle task view for each unfinished task
                      ZStack{
                          
                          RectangleTaskView(task: task)
                              .onTapGesture {
                                  withAnimation {
                                      // Toggle the status of the task
                                      toggleTaskStatus(task: task)
                                  }
                              }
                      }
                  }
                  
                  // Loop through completed tasks
                  ForEach(completedTasks) { task in
                      // Display the rectangle task view for each completed task
                      RectangleTaskView(task: task)
                  }
              }
            //  .padding()
       //   }

    }
    
    private func toggleTaskStatus(task: Task) {
        // Find the index of the task in the unfinished tasks array
        if let index = unfinishedTasks.firstIndex(where: { $0.id == task.id }) {
            // Create an updated task with the toggled status
            let updatedTask = Task(name: task.name, isSelected: !task.isSelected)
            
            if updatedTask.isSelected {
                // If the task is marked as completed, move it to the completed tasks array
                unfinishedTasks.remove(at: index)
                completedTasks.append(updatedTask)
            } else {
                // If the task is marked as unfinished, move it back to the unfinished tasks array
                completedTasks.removeAll(where: { $0.id == task.id })
                unfinishedTasks.insert(updatedTask, at: index)
            }
        }
    }
}

struct DailyTasks_Previews: PreviewProvider {
    static var previews: some View {
        DailyTasks()
    }
}

struct RectangleTaskView: View {
    let task: Task
    
    var body: some View {
        Rectangle()
            .fill(task.isSelected ? Color("MainColor") : Color("MainColor").opacity(0.2))
            .frame(width: 340, height: 50)
            .cornerRadius(17)
          //  .animation(.easeInOut(duration: 0.5))
            .overlay(
                HStack{
                    Text(task.name) // Display the name of the task on the rectangle
                        .foregroundColor(task.isSelected ? Color.white : Color("MainColor"))
                        .font(.custom("basecoat", size: 20))
                    Spacer()
                    Text("")
                }.padding()
            )
    }
}






struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
}
