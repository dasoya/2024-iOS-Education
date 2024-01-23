//
//  GuessTheFlagUIView.swift
//  iOS
//
//  Created by dasoya on 1/23/24.
//

import SwiftUI

struct GuessTheFlagUIView: View {
    
    @State private var score = 0 // 점수
    @State private var showingScore = false // 점수 표시창
    @State private var showingEnd = false //게임 종료창
    @State private var scoreTitle = "" // Corret/ Wrong
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
    ].shuffled()
    @State private var correctFlag = Int.random(in: 0...2) // 0 or 1 or 2
    @State private var currentQuestion = 1 // 5번의 질문중 질문 넘버
    
    private let numberOfFlags = 3
    private let numberOfQuestions = 5
    
    struct FlagImage: View {
        var image : String
        var body: some View {
            Image(image)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctFlag {
            scoreTitle = "Correct"
            score += 1
        }
        else {
            scoreTitle = "Wrong!, that's ths flag of \(countries[number])."
        }
        
        showingScore = true
    }
    
    func shuffleFlags(){
        countries.shuffle()
        correctFlag = Int.random(in: 0...2)
    }
    
    func resetGame(){
        currentQuestion = 1
        score = 0
    }
    var body: some View {
        ZStack{
            RadialGradient(stops:[.init(color: .blue, location: 0.3),
                                  .init(color: .cyan, location: 1)],center: .bottom, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            
            VStack(){
                Text("Guess The flag")
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.white)
                    .padding()
                Text("Tap on the \(countries[correctFlag])")
                    .foregroundColor(.white)
                Text("Question \(currentQuestion)/ \(numberOfQuestions).")
                    .foregroundColor(.white)
                
                ForEach(0..<numberOfFlags, id: \.self){ number in
                    Button(){
                        //action
                        flagTapped(number)
                    } label: {
                        FlagImage(image: countries[number])
                    }
                    
                }.padding()
            }
    
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue"){
                if currentQuestion == numberOfQuestions {
                    showingEnd = true
                } else {
                    currentQuestion += 1
                    shuffleFlags()
                    
                }
            }
        } message: {
            Text("Your score is \(score).")
        }
        .alert("End of Game", isPresented: $showingEnd){
            Button("Reset Game"){
               resetGame()
                shuffleFlags()
            }
        } message: {
            Text("Your Final score is \(score).")
        }
    }
}

#Preview {
    GuessTheFlagUIView()
}
