//
//  Community21stCounter.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct Community21stCounter: View {
    let totalDays: Int = 21
    let countdownTimer = CountdownTimer(totalSeconds: 21 * 24 * 60 * 60) // Assuming 21 days

    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 2)
                              .background(Color.gray.opacity(0.1))
                              .frame(width: 230, height: 50)
                              .cornerRadius(12)
            HStack(spacing: 80){
                VStack{
                    
                    Text("\(countdownTimer.remainingDays)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                    Text("DD")
                        .font(.footnote)
                    
                    
                }
                
                VStack{
                    
                    Text("\(countdownTimer.remainingHours)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                    Text("HH")
                        .font(.footnote)
                }
            }
            
        
        }
    }
}

struct Community21stCounter_Previews: PreviewProvider {
    static var previews: some View {
        Community21stCounter()
    }
}

struct CountdownTimer {
    let totalSeconds: Int
    
    var remainingDays: Int {
        return totalSeconds / (24 * 60 * 60)
    }
    
    var remainingHours: Int {
        return (totalSeconds % (24 * 60 * 60)) / (60 * 60)
    }
    
    // Add more properties if needed (e.g., minutes, seconds)
}


