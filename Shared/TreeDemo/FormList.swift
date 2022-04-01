//
//  FormList.swift
//  LearningSwiftUIExample
//
//  Created by MrChen on 2022/3/28.
//

import SwiftUI

struct FormList: View {
    
    // 控制是否展开
    @State var isProfileExpanded = true
    
    var body: some View {
        Form {
            Section{
                DisclosureGroup(isExpanded: $isProfileExpanded) {
                    TextField("姓名", text: .constant(""))
                    TextField("邮箱", text: .constant(""))
                    DatePicker(selection: .constant(Date()), label: {
                        Text("生日")
                            .font(.headline)
                            .foregroundColor(.gray)
                    })
                } label: {
                    Text("个人信息")
                        .font(.headline)
                }
            }
            
            Section {
                DisclosureGroup{
                    TextField("地址", text: .constant(""))
                    TextField("省", text: .constant(""))
                    TextField("市", text: .constant(""))
                    TextField("区", text: .constant(""))
                    TextField("电话", text: .constant(""))
                } label: {
                    Text("联系信息")
                        .font(.headline)
                }
            }
            
            Section {
                DisclosureGroup{
                    Toggle("Push", isOn: .constant(true))
                    Toggle("Email", isOn: .constant(false))
                    Toggle("SMS", isOn: .constant(true))
                } label:{
                    Text("偏好设置")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
