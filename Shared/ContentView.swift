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
      List(listData) {item in
          NavigationLink(destination: viewForItem(title: item.title)) {
            Text(item.title)
          }
      }
      .listStyle(.grouped)
      .navigationTitle("SwiftUIExample")
    }
  }

  // 列表数据
  private let listData: [ListItem] = [
    ListItem(title: "树状列表"),
    ListItem(title: "栅栏不规则布局")
  ]
    
    struct viewForItem: View {
        var title: String
        
        var body: some View{
            switch title {
            case "树状列表":
                TreeList()
            case "栅栏不规则布局":
                LazyHGridDemo1()
            default:
                Text("hello")
            }
        }
    }
}

struct ListItem: Hashable, Identifiable {
    var id = UUID()
    
  // 标题
  var title: String

  init(
    title: String
  ) {
    self.title = title
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
