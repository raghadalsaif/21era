//
//  DaysAndTasks.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct DaysAndTasks: View {
    
    let numberOfDays = 21
    @State var selectedDay: Int?
    @State private var completedDays: [Int] = []

    
    var body: some View {
       
        VStack{
            
            ZStack{
                
                Rectangle()
                    .frame(width: 340 , height: 50)
                    .foregroundColor(Color("MainColor"))
                    .opacity(0.3)
                    .cornerRadius(17)
                
                ScrollView(.horizontal , showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(1...numberOfDays, id: \.self) { day in
                            DayButton(day: day, selectedDay: $selectedDay)
                        }
                    }
                   
                    
                }
                .padding()
               
            }
           // .padding(.all)
         
            
            
            if let selectedDay = selectedDay {
                
                Divider()
                
                VStack{
                    Text("Daily Task")
                        .font(.title)
                     //   .padding()
                     
                        DailyTasks()
              
                }
             
            
            }
            
            
        }
        
        
        
        
    }
}


struct DayButton: View {
    let day: Int
    @Binding var selectedDay: Int?
    
    var body: some View {
        
        
        Button(action: {
            selectedDay = day
        }) {
            Text("\(day)")
                .font(.title2)
                .frame(width: 40, height: 45)
                .foregroundColor(.white)
                .background(dayBackground)
                .clipShape(Circle())
        }
        .buttonStyle(DayButtonStyle(selected: selectedDay == day))
    }
    
    var dayBackground: some View {
        
        Group {
            if selectedDay == day {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("MainColor"))
            } else {
                Circle()
                    .fill(Color("MainColor"))
                    .opacity(0.5)
            }
        }
    }
}




struct DayButtonStyle : ButtonStyle {
    
    let selected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}



struct DaysAndTasks_Previews: PreviewProvider {
    static var previews: some View {
        DaysAndTasks()
    }
}
