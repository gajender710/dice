//
//  ContentView.swift
//  dice
//
//  Created by Gajender Jangir on 21/04/22.
//

import SwiftUI


struct ContentView: View {
    @State var leftDiceNum=1
    @State  var rightDiceNum=1
    var body: some View {
        
        NavigationView {
            VStack {
                    NavigationLink(destination: VListView()) {
                        Text("Next")
                            .font(.title)
                        
                    }
                NavigationLink(destination: AccountForm()) {
                    Text("Account Form")
                        .font(.title)
                }
                
        
                        Spacer()
                        HStack {
                            diceImage(diceNum: leftDiceNum)
                            diceImage(diceNum: rightDiceNum)
                        }
                        Spacer()
                        
                RollButton(leftDiceNum: $leftDiceNum, rightDiceNum: $rightDiceNum)
                        Spacer()
                
            }
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//sets dice image
struct diceImage: View {
    var diceNum:Int
    var body: some View {
        Image("dice\(diceNum)")
            .resizable()
            .frame(width: 150, height: 150)
    }
}

//binding here connects this struct view property like leftDIcenum  to main view property 
struct RollButton: View {
    @Binding var leftDiceNum:Int
    @Binding var rightDiceNum:Int
    var body: some View {
        Button("Roll") {
            self.leftDiceNum=Int.random(in: 1...2)
            self.rightDiceNum=Int.random(in: 1...2)
        }
        .font(.system(size: 50))
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
