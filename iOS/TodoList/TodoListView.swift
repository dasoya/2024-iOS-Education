//
//  TodoListView.swift
//  iOS
//
//  Created by dasoya on 1/30/24.
//


//View
import SwiftUI

struct TodoListView: View {
    
    @StateObject private var vm = TodoListViewModel()
    @State private var newTodoTitle = ""
    

    var body: some View {
        
        NavigationStack{
            
            VStack{
                List{
                 
                    ForEach(vm.todos){ todo in
                       
                        HStack{
                            
                            Button { //action
                                vm.toggleTodoCompletion(todo: todo)
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                            }
                            .buttonStyle(.borderless)
                            
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .foregroundColor(todo.isCompleted ? .gray : .black)
                            
                        }
                    }.onDelete(perform: vm.removeTodo)
                }
                
                HStack{
                    TextField("New Todo", text: $newTodoTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        vm.addTodo(title: newTodoTitle)
                        newTodoTitle = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.green)
                            .imageScale(.large)
                    }

                }.padding()
                
                
                
            }.navigationTitle("Todo List")
            .navigationBarItems(trailing: EditButton())
            
            // .top .bottom .leading .trailing
            
            
        }
        
    }
}


#Preview {
    TodoListView()
}
