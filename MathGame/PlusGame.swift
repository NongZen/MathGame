//
//  PlusGame.swift
//  MathGame
//
//  Created by Theerabhop Suakaraya on 25/11/2566 BE.
//

import SwiftUI

struct PlusGame: View {
    @Environment(\.presentationMode) var presentationMode
    @State var Uanswer = ""
    @State var num1 = Int.random(in: 111...999)
    @State var num2 = Int.random(in: 111...999)
    var Qanswer: Int {
        return num1 + num2
    }
    
    
    
    @State var Streak = 0
    @State var showAlert = false
    @State var showAlert2 = false
    @State var correct = ""
    @State var heading = ""
    
    @AppStorage("highStreakPlus") public var highStreak = 0
    
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Highest Streak: \(highStreak)")
                    .font(.headline)
                    .fontWeight(.semibold)
            Text("Streak: \(Streak)")
                .font(.headline)
                .fontWeight(.medium)
            Text("Guess the answer:")
            Text("\(num1) + \(num2) = ?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Answer", text: $Uanswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)
            HStack(spacing: 20){
                Button("Back"){presentationMode.wrappedValue.dismiss()}
                    .foregroundColor(.white)
                    .frame(width: 100,height: 50)
                    .background(.gray)
                    .cornerRadius(100)
                    .shadow(color: .orange, radius: 10)
                
                Button("Summit"){Summit()}
                    .foregroundColor(.white)
                    .frame(width: 100,height: 50)
                    .background(.gray)
                    .cornerRadius(100)
                    .shadow(color: .yellow, radius: 10)
                    .alert(isPresented: $showAlert){Alert(
                        title: Text(heading),
                        message : Text("You get the \(correct) Answer!!!"),
                        primaryButton: .destructive(
                            Text({return (String(Qanswer) == Uanswer) ? "Reset" : "GG"}()),
                            action:ResetAll
                        ),
                        secondaryButton: .default(Text({return (String(Qanswer) == Uanswer) ? "Play Again" : "GG"}()),action:({
                            (String(Qanswer) == Uanswer) ? ResetGame() : ResetAll()
                        }))
                    )
                        
                    }
                   
            }
                
                
        }
        .padding()
        .navigationBarHidden(true)
    }
    func Summit(){
        if(String(Qanswer) == Uanswer){
            correct = "correct"
            heading = "Nice!"
            Streak += 1
            if(highStreak < Streak){
                highStreak = Streak
            }
        } else{
            correct = "wrong"
            heading = "Game Over!"
        }
        showAlert.toggle()
    }
    
    func ResetGame(){
        num1 = Int.random(in: 111...999)
        num2 = Int.random(in: 111...999)
        Uanswer = ""
        
    }
    func ResetAll(){
        num1 = Int.random(in: 111...999)
        num2 = Int.random(in: 111...999)
        Uanswer = ""
        Streak = 0
        
    }
}

struct PlusGame_Previews: PreviewProvider {
    static var previews: some View {
        PlusGame()
    }
}
