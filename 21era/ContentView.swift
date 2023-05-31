//
//  ContentView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 10/11/1444 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Splash")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
               
            VisualEffectView(effect: UIBlurEffect (style: .light))
               .edgesIgnoringSafeArea(.all)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
