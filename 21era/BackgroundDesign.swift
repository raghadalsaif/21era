//
//  ContentView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 10/11/1444 AH.
//

import SwiftUI

struct BackgroundDesign: View {
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

struct BackgroundDesign_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundDesign()
    }
}
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
