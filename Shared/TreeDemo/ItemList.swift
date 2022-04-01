//
//  ItemList.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/3/28.
//

import SwiftUI

struct ItemList: View {
    var items: [TreeItem]
    
    var body: some View {
        // 可折叠的列表
        List(items, children: \.children){
            Text($0.title)
        }
        .listStyle(.grouped)
    }
}
