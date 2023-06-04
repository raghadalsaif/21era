//
//  Friends.swift
//  21era
//
//  Created by Nsreen Alfaifi on 11/11/1444 AH.
//

import SwiftUI

struct Friends: View {
    
    let friends = ["Friend 1", "Friend 2", "Friend 3", "Friend 4", "Friend 5", "Friend 6", "Friend 7", "Friend 8", "Friend 9"]
    
    var body: some View {
        
        
        
        ScrollView {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 1 ) {
                    ForEach(0..<friends.count) { index in

                        FriendscReqCard()
                            .padding()
                    }
                }
            }
        }
    

            
            
            
            
            
            
//
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: -40) {
//                    ForEach(0..<friends.count, id: \.self) { index in
//                        VStack{
//
//
//                            FriendscSeqCard()
//                                .padding(.all , 10)
//                        }
//
//                    }
//                }
//                .padding()
//            }
        }

}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}



struct FriendscReqCard: View {
    
    @State private var userData = UserData(username: "Nsreen", personalType: "s", phone: "0555555555", password: "12345678", Character: "Character")
    var body: some View {
        
        
        ZStack{
            
            Button {
                //
                
            } label: {
                Image("CharacterBackground2")
                    .frame(width: 270 , height: 150 )
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 5 , x: 0, y: 0)
                    .overlay(
                        
                        Image(userData.Character)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 135 )
                            .padding(.top )
                            .overlay(
                                Rectangle()
                                    .frame(width: 270 , height: 38 )
                                    .foregroundColor(Color.white).blur(radius: 0.9 ).opacity(0.6)
                                    .padding(.top , 110)
                                    .cornerRadius(12)
                                    .overlay(
                                        HStack(spacing: 155){
                                            
                                            Text(userData.username)
                                                .foregroundColor(.black)
                                                .font(.headline)
                                            Button {
                                                
                                            } label: {
                                                Image(systemName: "hands.clap")
                                                    .resizable()
                                                    .frame(width: 33, height: 30)
                                                    .foregroundColor(Color("MainColor"))
                                            }
                                            
                                            
                                        } .padding(.top , 115)
                                        
                                    )// Overlay 2
                                
                            )// Overlay 2
                        
                    )// Overlay 1
            }
        }
    }
}



