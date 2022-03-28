//
//  Item.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/3/28.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var title: String = ""
    var children: [Item]?
}
