//
//  ContentView.swift
//  Shared
//
//  Created by MrChen on 2022/3/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(listData){item in
                NavigationLink(destination: TreeList()){
                    Text(item.title)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("SwiftUIExample")
        }
    }
    
    // 列表数据
    private let listData: [ListItem] = [
        ListItem(title: "树状列表")
    ]
}

struct ListItem: Hashable, Identifiable{
    var id: Self { self }
    var title: String
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
