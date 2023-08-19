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
    
    // save items any time items array is updated
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    // get items from user defaults
    func getItems() {
        // unwrap data
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
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
    
    // save items with persistence
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
