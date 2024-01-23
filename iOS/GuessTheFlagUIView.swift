//
//  GuessTheFlagUIView.swift
//  iOS
//
//  Created by dasoya on 1/23/24.
//

import SwiftUI

struct GuessTheFlagUIView: View {
    
    @State private var score = 0
    @State private var showingScore = false
    @State private var showingEnd = false
    @State private var scoreTitle = ""
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
    @State private var correctFlag = Int.random(in: 0...2)
    @State private var currentQuestion = 1
    
    private let numberOfFlags = 3
    private let numberOfQuestions = 5
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GuessTheFlagUIView()
}
