//
//  ContentView.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 14/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Image("HeaderTaskImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    Text("Tasks")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .frame(width: .infinity, height: 220)
            
            Spacer()
            
            VStack() {
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("Purple"), Color("DarkPurple")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(30)
            .shadow(radius: 30)
        }
        .ignoresSafeArea()
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
