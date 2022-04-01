//
//  TreeItem.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/4/1.
//

import SwiftUI

struct TreeItem: Identifiable {
    let id = UUID()
    
    // 标题
    var title: String
  // 子节点
  var children:[TreeItem]?
    
}
