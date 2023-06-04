//
//  CommunityView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 11/11/1444 AH.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {

        NavigationView{
            ZStack{
           
                VStack(alignment: .leading ,spacing: 1){
                    
                    Divider()
                    
                    VStack(alignment: .leading , spacing: 40){
                        
                        
                        //21st Challenge
                        VStack(alignment: .leading,spacing: 16){
                           
                            Text("21st Challenge")
                                .font(.title2)
                            
                            Community21stCounter()
                            .padding(.leading , 50)
                        }
                        
                        
                        VStack(spacing: -10){
                            
                            //Friends
                            VStack(spacing: 1){
                                HStack(spacing: 210){
                                    Text("Friends")
                                        .font(.title2)
                                    
                                    Button {
                                        FriendsPage()
                                        
                                    } label: {
                                        
                                        HStack(spacing:2){
                                            Text("See All")
                                            Image(systemName: "chevron.forward")
                                            
                                        }//end HStack
                                        .foregroundColor(Color("MainColor"))
                                        .font(.headline)
                                        
                                    }//enf button
                                    
                                }//end HStack
                                
                                Friends()
                                
                            }
                            
                            
                            //Challenge by price
                            VStack(alignment: .leading , spacing: 1){
                                
                                Text("Challenge by price")
                                    .font(.title2)
                                
                                ChallengesByPrice()
                                
                                
                                
                            }
                        }
                    }   .padding()
                    
                }// end VStack
             
                
                
                
                .navigationTitle("Community")
            }
            
        }// end NavigationView
        
        
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
