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
        List(0..<myTypes.count, id:\.self){i in
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
func listData()->[TreeItem] {
    return [
        TreeItem(
            title: "Computers",
            children: [
                TreeItem(
                    title: "Desktop",
                    children: [
                        TreeItem(title: "IMac"),
                        TreeItem(title: "Mac mini"),
                        TreeItem(title: "Mac pro")
                    ]
                ),
                TreeItem(
                    title: "Laptop",
                    children: [
                        TreeItem(title: "Macbook pro"),
                        TreeItem(title: "MacBook air")
                    ]
                )
            ]
        ),
        TreeItem(
            title: "Smartphones",
            children: [
                TreeItem(title: "IPhone 11"),
                TreeItem(title: "IPhone 12"),
                TreeItem(title: "IPhone 13")
            ]
        ),
        TreeItem(
            title: "Tablets",
            children: [
                TreeItem(title: "IPad Mini"),
                TreeItem(title: "IPad Air"),
                TreeItem(title: "IPad Pro")
            ]
        ),
        TreeItem(
            title: "Wearables",
            children: [
                TreeItem(title: "Apple Watch Series 3"),
                TreeItem(title: "Apple Watch Series 5"),
                TreeItem(
                    title: "Bands",
                    children: [
                        TreeItem(title: "Sport Band"),
                        TreeItem(title: "Leather Band"),
                        TreeItem(title: "Milanese Band")
                    ]
                )
            ]
        )
    ]
}

