//
//  TodoListViewModel.swift
//  iOS
//
//  Created by dasoya on 1/30/24.
//

//ViewModel
import Foundation

class TodoListViewModel : ObservableObject {
    
   @Published var todos : [TodoItem] = []
    
    func addTodo(title: String){
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
    }
    
    func removeTodo(at indexSet: IndexSet){
        todos.remove(atOffsets: indexSet)
    }
    
    func toggleTodoCompletion(todo: TodoItem){
        
        if let index = todos.firstIndex(where: { $0.id == todo.id})
        {
            todos[index].isCompleted.toggle() // true -> false, false -> true
        }
    }
}
