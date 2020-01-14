//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Ian Chen on 2020/1/14.
//  Copyright © 2020 Ian Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    
    @State private var enableOfflineCache = false
    @State private var name: String = "Ian"
    // 2.
    var Genders = ["Male", "Female", "Others"]
    @State private var selectedMode = 0
    var body: some View {
        
        return Group {
            if show {
//                HomeView()
            }
            else {
                 NavigationView {
                    // 3.
//                    Image("profileDefaultIcon").resizable()
//                    .frame(width: 128.0, height: 128.0)
//                    .clipShape(Circle())
//                    .shadow(radius: 10)
//                    Divider()
//                    VStack(alignment: .leading) {
//                        Text("Name:")
//                        Text("Email:")
//                        Text("Phone:")
//                    }
//                    Divider()
//                    Button("back") {
//                        self.show = true
//                    }
                          Form {
                            HStack{
                                Image("profileDefaultIcon")
                                    .resizable()
                                    .frame(width: 128.0, height: 128.0,alignment: .center)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            }
                              // 4.
                              Section(header: Text("Account")){
                                
                                HStack {
                                    Text("User Name")
                                    Spacer()
//                                    TextField("Enter your name", text: $name)
                                    Text("Ian Chen")
                                }
                                
                                HStack {
                                    Text("Email")
                                    Spacer()
                                    Text("ian121362@gmail.com")
                                }
                                Picker(selection: $selectedMode, label: Text("Gender")) {
                                    ForEach(0..<Genders.count) {
                                        Text(self.Genders[$0])
                                    }
                                }
                              }
                              
                              // 5.
                              Section(header: Text("Settings")) {
                                Toggle(isOn: $enableOfflineCache) {
                                      Text("Offline Cache")
                                }
                              }
                          } .navigationBarTitle("Profiles & Settings")
                            .navigationBarItems(trailing:
                                Button("Done") {
                                    self.show = true
                                }
                            )
                            
                        
                      }
//                .sheet(isPresented: $show) {
//                    StoryView()
//                }
            }
        }
//       .sheet(item: true, content:HomeView())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
