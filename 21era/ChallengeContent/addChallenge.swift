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
                    .font(.largeTitle)
                    .bold()
                
                Text("Choose a way to create your challenge")
                    .foregroundColor(.gray)
                
                
            }.padding()
            
            
            VStack{
          
                NavigationLink(destination: askpage()) {
                    Text("AI Challenge Generator")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .bold()
                        .background(Color("MainColor"))
                        .cornerRadius(17)
                    
                }
                
                

                
                Button {
                    
                } label: {
                    Text("Create my own")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
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
    @State private var selectedLevel = "Experience Level"
    let levels = ["Beginner", "Intermediate", "Advanced"]
    
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
                            .font(.body)
                    }
                    .frame(height: 50)
                    .background(Color("MainColor").opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("MainColor").opacity(0.1))
                            .frame(height: 50)
                        // .background(Color("TextFildeColor").opacity(0.5))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        
                        HStack{
                            Image(systemName: "stairs")
                                .resizable()
                                .frame(width: 25 , height: 25)
                                .foregroundColor(Color("MainColor"))
                                .padding(.leading, 10)
                                .padding(.trailing, 4)
                            
                            Text(selectedLevel)
                            
                            
                            Spacer()
                            
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
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }.padding(.bottom , 80)
                
                
                
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Perform cancel action here
                            
                        }) {
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





