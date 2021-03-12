//
//  Todo.swift
//  TodoList
//
//  Created by joonwon lee on 2020/03/19.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit


// TODO: Codable과 Equatable 추가
// Codable : json <-> struct 간 변환작업을 쉽게 도와준다
struct Todo: Codable, Equatable { //"==" 연산을 위해 두가지 super를 추가
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // TODO: update 로직 추가 : OK
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        // TODO: 동등 조건 추가 : OK
        return lhs.id == rhs.id
    }
}



//여러개의 Todo를 관리하는 역할
class TodoManager {
    //single 톤 객체 : 한개객체만으로 여기저기서 사용될 때 사용
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        //TODO: create로직 추가 : OK
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        return Todo(id: 1, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        //TODO: add로직 추가 : OK
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
        //TODO: delete 로직 추가 : OK
        todos = todos.filter { $0.id != todo.id }
        saveTodo()
        
//        if let index = todos.firstIndex(of: todo) {
//            todos.remove(at: index)
//        }
    }
    
    func updateTodo(_ todo: Todo) {
        //TODO: updatee 로직 추가 : OK
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}



//viewController에서 사용되는 viewModel 단위 객체
class TodoViewModel {
    
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
    
    //viewModel은 manager를 통해 수행을 전달한다
    private let manager = TodoManager.shared
    
    var todos: [Todo] {
        return manager.todos
    }
    
    var todayTodos: [Todo] {
        return todos.filter { $0.isToday == true }
    }
    
    var upcompingTodos: [Todo] {
        return todos.filter { $0.isToday == false }
    }
    
    var numOfSection: Int {
        return Section.allCases.count
    }
    
    
    
    func addTodo(_ todo: Todo) {
        manager.addTodo(todo)
    }
    
    func deleteTodo(_ todo: Todo) {
        manager.deleteTodo(todo)
    }
    
    func updateTodo(_ todo: Todo) {
        manager.updateTodo(todo)
    }
    
    func loadTasks() {
        manager.retrieveTodo()
    }
}

