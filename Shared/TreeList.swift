//
//  TreeList.swift
//  LearingSwiftUIExample
//
//  Created by MrChen on 2022/3/28.
//

import Foundation
import SwiftUI

struct TreeList: View{
    @State var myType: MyType?
    
    var body: some View {
        List{
            Button("ItemList") {
                myType = .itemsList
            }
            Button("SidebarList") {
                myType = .sidebarList
            }
            Button("FormList") {
                myType = .formList
            }
        }
        .sheet(item: $myType) { type in
            switch type {
            case .itemsList:
                ItemList(items: listData())
            case .sidebarList:
                SidebarList(items: listData())
            case .formList:
                FormList()
            }
        }
        .listStyle(.grouped)
    }
}

enum MyType: String, Identifiable {
    var id: String { self.rawValue}
    case itemsList
    case sidebarList
    case formList
}

// 以跳转的方式显示
struct ListView: View {
    private let myTypes: [MyType] = [
        .itemsList,
        .sidebarList,
        .formList
    ]
    
    var body: some View {
        List(0..<myTypes.count){i in
            let type: MyType = myTypes[i]
            switch type {
            case .itemsList:
                NavigationLink(destination: ItemList(items: listData())) {
                    Text("ItemList")
                }
            case .sidebarList:
                NavigationLink(destination: SidebarList(items: listData())) {
                    Text("SidebarList")
                }
            case .formList:
                NavigationLink(destination: FormList()) {
                    Text("FormList")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

// 树状数据
func listData()->[Item] {
    return [
        Item(
            title: "Computers",
            children: [
                Item(
                    title: "Desktop",
                    children: [
                        Item(title: "IMac"),
                        Item(title: "Mac mini"),
                        Item(title: "Mac pro")
                    ]
                ),
                Item(
                    title: "Laptop",
                    children: [
                        Item(title: "Macbook pro"),
                        Item(title: "MacBook air")
                    ]
                )
            ]
        ),
        Item(
            title: "Smartphones",
            children: [
                Item(title: "IPhone 11"),
                Item(title: "IPhone 12"),
                Item(title: "IPhone 13")
            ]
        ),
        Item(
            title: "Tablets",
            children: [
                Item(title: "IPad Mini"),
                Item(title: "IPad Air"),
                Item(title: "IPad Pro")
            ]
        ),
        Item(
            title: "Wearables",
            children: [
                Item(title: "Apple Watch Series 3"),
                Item(title: "Apple Watch Series 5"),
                Item(
                    title: "Bands",
                    children: [
                        Item(title: "Sport Band"),
                        Item(title: "Leather Band"),
                        Item(title: "Milanese Band")
                    ]
                )
            ]
        )
    ]
}

