//
//  addChallenge.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct addChallenge: View {
    
    
    var body: some View {
        
        VStack(spacing:80){
            VStack(alignment: .leading , spacing: 12){
                Text("Create your challenge to achieve goals")
                    .font(.custom("basecoat-bold", size: 30))
                  
                
                Text("Choose a way to create your challenge")
                    .foregroundColor(.gray)
                    .font(.custom("basecoat", size: 16))
                
                
            }.padding()
            
            
            VStack{
          
                NavigationLink(destination: askpage()) {
                    Text("AI Challenge Generator")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.custom("basecoat", size: 20))
                        .bold()
                        .background(Color("MainColor"))
                        .cornerRadius(17)
                    
                }
                
                

                
                Button {
                    
                } label: {
                    Text("Create my own")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.custom("basecoat", size: 20))
                        .bold()
                        .background(Color("MainColor"))
                        .cornerRadius(17)
                }

                
            }
            
            Spacer()
            
            
            
        }.padding()
        
        
        
    }
}







struct addChallenge_Previews: PreviewProvider {
    
    static var previews: some View {
        askpage()
    }
}








struct askpage :View{
    @State private var QuAi: String = ""
 
    @State private var selectedSkillLevel = SkillLevel.beginner

    enum SkillLevel: String, CaseIterable, Identifiable {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case expert = "Expert"

        var id: String { self.rawValue }
    }

    var body: some View{
        
        NavigationView{
            
            
            VStack{
                
                VStack{
                    
                    HStack {
                        Image(systemName: "pencil.line")
                            .resizable()
                            .frame(width: 25 , height: 25)
                            .foregroundColor(Color("MainColor"))
                            .padding(.leading, 10)
                            .padding(.trailing, 4)
                        
                        TextField("Ask AI to make your challenge plan", text: $QuAi)
                            .foregroundColor(.black)
                            .font(.custom("basecoat", size: 16))

                    }
                    .frame(height: 50)
                    .background(Color("MainColor").opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                         
                        ZStack{
                            Rectangle()
                                .fill(Color("MainColor").opacity(0.1))
                                .frame(height: 50)
                                .cornerRadius(8)
                                .padding(.horizontal)
                            
                            HStack{
                                Image(systemName: "stairs")
                                    .resizable()
                                    .frame(width: 25 , height: 25)
                                    .foregroundColor(Color("MainColor"))
                                    .padding(.leading, 10)
                                    .padding(.trailing, 4)
                                
                                Text(selectedSkillLevel.rawValue)
                                    .font(.custom("basecoat", size: 16))

                                    .foregroundColor(.black)
                                               
                                
                                
                                Spacer()
                                
                                
                                Menu {
                                    ForEach(SkillLevel.allCases) { level in
                                        Button(action: {
                                            selectedSkillLevel = level
                                        }) {
                                            Text(level.rawValue)
                                        }
                                    }
                                } label: {
                                    
                                    
                                    Rectangle()
                                        .fill(Color("MainColor"))
                                        .frame(width: 55, height: 30 )
                                        .cornerRadius(10)
                                        .padding()
                                    
                                        .overlay {
                                            Text("Level")
                                                .font(.custom("basecoat", size: 16))

                                                .foregroundColor(.white)
                                               
                                             
                                             
                                        }
                                
                                    
                                }
                             
                            }.padding()
                        }
                     
                    
                    
                    
                    
                    
                 
                }
                Spacer()
                
                VStack{
                    
                    Button {
                        
                    } label: {
                        Text("Continue")
                            .frame(width: 280 , height: 50)
                            .background(Color("MainColor"))
                            .cornerRadius(15)
                            .font(.custom("basecoat-bold", size: 24))

                            .foregroundColor(.white)
                    }
                }.padding(.bottom , 80)
                
                
                
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: ChallengeView()) {
                            Image(systemName: "xmark.circle")
                                .font(.title2)
                                .foregroundColor(Color("MainColor"))
                        }
                        
                        
                        
                    
                    }
                }.navigationBarTitle("Challenge")
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}





