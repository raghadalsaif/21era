//
//  _21ERAView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 15/11/1444 AH.
//

import SwiftUI

struct _21ERAView: View {
    @State private var selectedOption: Int = 0

    var body: some View {
        NavigationView {
            
            let options = ["Profile" , "LeaderBoard"]
            
            VStack{
                Divider()
                VStack {

                    Picker("", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 350)
                    .padding()
                    
                    
                    
                    if selectedOption == 0 {
                        Profile()
                         
                    }
                    
                    
                    
                    
                   
                }
                .navigationTitle("21ERA")
            }
        }
        
    }
}

struct _21ERAView_Previews: PreviewProvider {
    static var previews: some View {
        _21ERAView()
    }
}
