//
//  ListViewModel.swift
//  TodoList
//
//  Created by Pedro Gutierrez on 8/19/23.
//

import Foundation

/*
 CRUD FUNCTIONS
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second!", isCompleted: true),
            ItemModel(title: "Third!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    // delete list item
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)

    }
    
    // move list item
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // add item to todo list
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        
        items.append(newItem)
    }
    
    // update item completed status
    func updateItem(item: ItemModel) {
        // find index of item being updated in items array, then update isCompleted status
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
