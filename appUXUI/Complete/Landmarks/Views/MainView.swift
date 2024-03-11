//
//  MainView.swift
//  Landmarks
//
//  Created by Alumno on 09/03/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import Lottie


struct MainView: View {
    var body: some View {
        
        /*LottieView(url: Bundle.main.url(forResource: "ltl3aocv", withExtension: "lottie")!)*/
        
        NavigationStack {
            VStack {
                
                Text("PolluSpot")
                    .font(.custom("BONITA", size: 70))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.5, green: 0.8, blue: 0.7))
                    .padding(.top,50)
                    .padding(.bottom, 40)
                    
                
            
                GifImage("eye")
                
                Text("¿Ves contaminación?")
                
                NavigationLink {
                    ContentView()
                } label: {
                    Image(systemName: "eye")
                    Text("Iniciar")
                        
                }
                .padding(.top, 10)
                .padding(.bottom, 50)
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.5, green: 0.8, blue: 0.7))
                
            }
            .padding()
        }
    }
}


#Preview {
    MainView()
        .environment(ModelData())
}
