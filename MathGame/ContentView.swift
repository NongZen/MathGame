//
//  ContentView.swift
//  MathGame
//
//  Created by Theerabhop Suakaraya on 25/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.black.opacity(0.9))]
    }
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay(RadialGradient(gradient: Gradient(colors: [.orange, .yellow]), center: .topTrailing, startRadius: 20, endRadius: 500))
                    .ignoresSafeArea()
                    .offset(y:-400)
                    .opacity(0.95)
                    .shadow(color: Color.yellow , radius: 5)
                List{
                    NavigationLink(destination: MultipleGame()){
                        HStack{
                            Text("Multiple")
                                .foregroundColor(.black)
                                .font(.headline)
                                .fontWeight(.black)
                        }
                        
                        
                    }.listRowBackground(
                        Color.white
                            .opacity(0.7)
                    )
                    
                    NavigationLink(destination: PlusGame()){
                        HStack{
                            Text("Plus")
                                .foregroundColor(.black)
                                .font(.headline)
                                .fontWeight(.black)
                        }
                        
                        
                    }.listRowBackground(
                        Color.white
                            .opacity(0.7)
                    )
                    
                }.padding(.top, 25)
                    .padding(.horizontal)
                    .scrollContentBackground(.hidden)
                    .shadow(color: .yellow.opacity(0.8) , radius: 20)
            }
            .navigationTitle("‎ ‎‎ ‎MathGames")
            .background(.blue.opacity(0.3))
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
