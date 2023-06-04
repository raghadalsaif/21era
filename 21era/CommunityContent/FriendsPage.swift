//
//  FriendsPage.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct FriendsPage: View {
    
    @State private var selectedOptionIndex = 0
    @State private var searchTextFriends = ""
    @State private var searchTextRequests = ""
    let options = ["Friends", "Requests"]
    
    let FriendsData = ["Nsreen", "Shaden", "Razan", "Malak", "Raghad"]
    @State private var isFriend : Bool = false

    
    
    var filteredFriends: [String] {
    
        if searchTextFriends.isEmpty {
            return FriendsData // Return all friends if search text is empty
            
        } else {
            
            return FriendsData.filter { $0.localizedCaseInsensitiveContains(searchTextFriends) } // Filter friends based on search text
        }
    }
    
    
    var filteredRequests: [String] {
        
        if searchTextRequests.isEmpty {
            
            return requestsData // Return all requests if search text is empty
        } else {
            return requestsData.filter { $0.localizedCaseInsensitiveContains(searchTextRequests) } // Filter requests based on search text
        }
    }
    
    
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Picker(selection: $selectedOptionIndex, label: Text("Options")) {
                    
                    ForEach(0..<options.count, id: \.self) { index in
                        Text(options[index]).tag(index) // Display options in segmented picker
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle()) // Apply segmented picker style
                .frame(width: 350)
                
                
                //All Friends
                if selectedOptionIndex == 0 {
                    SearchBar(text: $searchTextFriends, placeholder: "    Search Friends") // Display search bar for friends
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: -40) {
                            ForEach(0..<FriendsData.count, id: \.self) { index in
                                VStack{
                                    FriendscSeqCard()
                                       
                                        .padding(.all , 10)
                                }
                                
                            }
                        }
                        .padding()
                    }
                    
                    
                    
                    
                    
                // All Requests
                } else {
                    SearchBar(text: $searchTextRequests, placeholder: "    Search Requests") // Display search bar for requests
                    
                    ForEach(0..<requestsData.count) { index in
                           
                        request()
                       
                    }
                    Spacer()
                        

                }

                
            }
            
        
            .navigationTitle("Friends")
        }
    }
}

struct FriendsPage_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPage()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        
        
        ZStack{
            TextField(placeholder, text: $text) // Search text field
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                
               
                // Apply rounded border style
            HStack(spacing: 300){
                Image(systemName: "magnifyingglass") // Search icon
                    .opacity(text.isEmpty ? 1 : 0)
                
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill") // Clear text button
                        .foregroundColor(.gray)
                        .opacity(text.isEmpty ? 0 : 1)
                }
            }
            .padding(.horizontal)
        }
    }
}



let requestsData = [
    "Raghad",
    "Malak"
]






struct FriendscSeqCard: View {
    
    @State private var userData = UserData(username: "Nsreen", personalType: "Cr", phone: "0555555555", password: "12345678", Character: "Character")
    var body: some View {
        
        
        ZStack{
            
            Button {
                
                //
                
            } label: {
                Image("CharacterBackground")
                    .resizable()
                    .frame(width: 170 , height: 150 )
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 3 , x: 0, y: 0)
                    .overlay(
                        
                        Image(userData.Character)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120 )
                            .padding(.top ,20 )
                            .overlay(
                                Rectangle()
                                    .frame(width: 170 , height: 32 )
                                    .foregroundColor(Color.white).blur(radius: 0.9 ).opacity(0.8)
                                    .padding(.top , 115)
                                    .cornerRadius(12)
                                    .overlay(
                                        HStack(spacing: 80){
                                            
                                            Text(userData.username)
                                                .foregroundColor(.black)
                                                .font(.callout)
                                            Button {
                                                
                                            } label: {
                                                Image(systemName: "hands.clap")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
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



struct request : View{
    var body: some View{
        
        ZStack{
            
            Rectangle()
            
                .fill(Color("FrindsCards"))
                .frame(width: 330 , height: 50)
                .cornerRadius(10)
            
            
        }
        
        
        
        
        
    }
}
