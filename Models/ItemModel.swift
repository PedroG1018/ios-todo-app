//
//  ItemModel.swift
//  TodoList
//
//  Created by Pedro Gutierrez on 8/16/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
