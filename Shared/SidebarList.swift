//
//  SidebarList.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/3/28.
//

import SwiftUI

struct SidebarList: View {
    var items: [Item]
    
    var body: some View {
        List{
            Label("Home", systemImage: "house")
            
            OutlineGroup(items, children: \.children){
                Text($0.title)
            }
            
            Section(header: Text("设置")) {
                Label("账户", systemImage: "person.crop.circle")
                Label("帮助", systemImage: "person.3")
                Label("退出", systemImage: "applelogo")
            }
        }
        // 设置section部分可以折叠
        .listStyle(SidebarListStyle())
    }
}
