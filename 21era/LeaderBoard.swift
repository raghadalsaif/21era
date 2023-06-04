//
//  LeaderBoard.swift
//  21era
//
//  Created by Nsreen Alfaifi on 15/11/1444 AH.
//

import SwiftUI

struct LeaderBoard: View {
    var body: some View {
        
        
        VStack{
            
                Rectangle()
                    .fill(Color("LeaderBoardColor1"))
                    .frame(width: 320 , height: 115)
                    .cornerRadius(20)
                    .overlay {
                        Rectangle()
                            .fill(Color("LeaderBoardColor2"))
                            .frame(width: 120 , height: 130)
                            .padding(.bottom , 15)
                        Rectangle()
                            .fill(Color("LeaderBoardColor2"))
                            .frame(width: 120 , height: 180)
                            .cornerRadius(50)
                            .padding(.bottom , 70)
                           
                        
                        
                        HStack{
                            
                            VStack{
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("LeaderBoardColor3"), Color("LeaderBoardColor4")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("2")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Nsreen")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("12")
                                    .foregroundColor(Color("LeaderBoardColor4"))
                                    .font(.title2)
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 20){
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("MainColor"), Color("LeaderBoardColor3")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("1")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Shaden")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("15")
                                    .foregroundColor(Color("MainColor"))
                                    .bold()
                                    .font(.title)
                                    .padding(.bottom , 80)
                            }
                            
                            
                            Spacer()
                            
                            
                            VStack{
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("sceondColor"), Color("LeaderBoardColor3")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("3")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Razan")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("10")
                                    .foregroundColor(Color("sceondColor"))
                                    .font(.title2)
                                    .bold()
                            }
                            
                        }.padding(.all , 20)
                            .padding(.trailing ,1)
                            .padding(.leading , -10)
                            
                         
                                
                            
                    }
                
              
         //   qq()
            
        }
    }
}

struct LeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoard()
    }
}




struct RhombusShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        path.move(to: startPoint)
        
        let topRightPoint = CGPoint(x: rect.maxX, y: rect.midY)
        path.addLine(to: topRightPoint)
        
        let bottomPoint = CGPoint(x: rect.midX, y: rect.maxY)
        path.addLine(to: bottomPoint)
        
        let bottomLeftPoint = CGPoint(x: rect.minX, y: rect.midY)
        path.addLine(to: bottomLeftPoint)
        
        path.closeSubpath()
        
        
        return path
    }
}

struct ss: View {
    var body: some View {
        RhombusShape()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .top, endPoint: .bottom))
            .frame(width: 50, height: 50)
           
        
    }
}







struct Item: Identifiable {
    var id = UUID()
    var imageName: String
    var score: Int
}

struct qq: View {
   
    var items = [
           Item(imageName: "item1", score: 8),
           Item(imageName: "item2", score: 6),
           Item(imageName: "item3", score: 9)
       ].sorted(by: { $0.score > $1.score })
      
      var body: some View {
          List(items) { item in
              HStack {
                  Rectangle()
                      .fill(Color.blue)
                      .frame(width: 50, height: 50)
                  
                  VStack(alignment: .leading) {
                      Text("Item Name")
                          .font(.headline)
                      Text("Score: \(item.score)")
                          .font(.subheadline)
                  }
              }
          }
      }
}


