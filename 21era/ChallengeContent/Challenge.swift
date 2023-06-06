//
//  Challenge.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct Challenge: View {
    @State var ChallengeTitle: String = "Learn HTML"
    @State var ChallengeTask: [String] = [ " Task1", " Task2"]
    @State var ChallengeProgress: String = "Nsreen"
    
    @State private var progress: CGFloat = 0.6

    
    var body: some View {
    
        NavigationView {
            VStack{
            
                Divider()
                   
                VStack(alignment: .leading,spacing: 16){
                    Text("Progress")
                        .font(.custom("basecoat-bold", size: 24))
                    ProgressView(value: progress)
                        .progressViewStyle(MyProgressViewStyle(progressColor: Color("MainColor")))
                }
                
               
                Divider()
                
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Days")
                        .font(.custom("basecoat-bold", size: 24))
                    DaysAndTasks()
                     
                }
                
          
                
                
                

              
                Spacer()
                   
            }
           
            .padding()
      
            .navigationTitle(ChallengeTitle)
               
     
    
        }

        
        
        
        
        
        
        
    }
    
    
    
    func updateProgress() {
        progress += 0.1
        if progress > 1.0 {
            progress = 0.0
        }
    }
    

}



struct MyProgressViewStyle: ProgressViewStyle {
    var progressColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(progressColor)
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}
