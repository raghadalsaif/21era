//
//  ChallengeView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct ChallengeView: View {
    
    let massege = "Explore thrilling challenges or start your own for an exhilarating experience of growth and accomplishment"
    var body: some View {
        NavigationView {
            
            VStack{
                HStack{
                    Text("Challenge")
                        .font(.largeTitle)
                        .bold()

                    Spacer()
                    
                    NavigationLink(destination: addChallenge()) {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .foregroundColor(Color("MainColor"))
                        
                    }
                     
                            
                        
                        
                    
                }
                .padding()
                
                
                Divider()
                Spacer()
                VStack(alignment: .center ,spacing: 12){
                    Text("Challenge is Empty")
                        .font(.title2)
                        
                    Text(massege)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)

                    
                }.padding().foregroundColor(.gray)
                Spacer()
                Spacer()

                
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
