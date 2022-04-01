//
//  LazyHGridDemo1.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/4/1.
//

import SwiftUI

struct LazyHGridDemo1: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(0..<30){index in
                    GeometryReader{r in
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("\(index)")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                            .frame(
                                width: index == 6 ? 2 * r.size.width  + 10 : r.size.width,
                                height: index == 16 ? 2 * r.size.height  + 10 : r.size.height
                            )
                    }
                    .frame(height: 50)
                    
                    if index == 6 || index == 18 {
                        Color.clear
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    // 定义每一列的宽度准则
    var gridItems: [GridItem]{
        [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}
