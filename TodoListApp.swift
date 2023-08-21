//
//  TodoListApp.swift
//  TodoList
//
//  Created by Pedro Gutierrez on 8/16/23.
//

import SwiftUI

/*
 MVVM Architecture
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel) 
        }
    }
}
