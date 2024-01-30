//
//  TodoItem.swift
//  iOS
//
//  Created by dasoya on 1/30/24.
//

//Model
import Foundation

struct TodoItem: Identifiable {
    
    var id = UUID()
    var title: String
    var isCompleted : Bool = false
}
