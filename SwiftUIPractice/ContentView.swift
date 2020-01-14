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
    
    @State private var useBirthdate = false
    @State private var name: String = "Ian"
    // 2.
    var Genders = ["Male", "Female", "Others"]
    @State  var selectedGender = 0
    
    @State private var birthDate = Date()
    
    @State private var selfLuckyValue: Double = 0
    
     @State var stepperNumberOfItems: Int = 0
    
    @State var finalNumber: Int = 0
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        
        return Group {
            NavigationView {
                  Form {
                    ExtractedSubviewShowThemeImage()
                      // 4.
                      Section(header: Text("Basic Info")){
                     
                        VStack {
                            // 2.
                            TextField(" Enter some text", text: $name)
                                .border(Color.black)
                            Text("Give us Your Name:")
                            // 3.
                            Text("\(name)")
                        }
                        
                        Picker(selection: $selectedGender, label: Text("Gender")) {
                            ForEach(0..<Genders.count) {
                                Text(self.Genders[$0])
                            }
                        }
                        
                        Toggle(isOn: $useBirthdate) {
                              Text("Use Birth date")
                        }
                        
                        if useBirthdate{
                            VStack {
                                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                    Text("Select a date")
                                }

                                Text("Date is \(birthDate, formatter: dateFormatter)")
                            }
                        }
                      }
                      
                      // 5.
                      Section(header: Text("Advance parameters")) {
                        VStack {
                            Slider(value: $selfLuckyValue, in: -100...100, step: 0.1)
                            Text("I'm feeling \(selfLuckyValue) % Lucky!")
                        }
                        .padding()
                        .font(.title)
                        Stepper(value: $stepperNumberOfItems, in: 0...10, label: { Text("Secret number:  \(stepperNumberOfItems)")}).padding()
                      }
                  
                    Button(action: {
                        self.show.toggle()
                        self.finalNumber = self.name.count + self.selectedGender
                        if self.useBirthdate{
                            self.finalNumber += "Date is \(self.birthDate)".count
                        }
                        self.finalNumber += Int(self.selfLuckyValue)
                        self.finalNumber += self.stepperNumberOfItems
                        
                    }) {
                        Text("Calculate My Lucky Number")
                        .frame(alignment: .center)
                    }
                    .sheet(isPresented: $show) {
                        ResultView(myString: self.name,finalNumber: self.finalNumber)
                    }
                  }
            }.navigationBarTitle("My Lucky Number")
          }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ResultView: View {
    private var name : String = "Tim"
    private var luckyNumber = 0
    @State private var showingAlert = false
    
    init(myString: String,finalNumber: Int) {
         print("ResultView: ",myString)
       
        self.name = myString
        self.luckyNumber = finalNumber
         print("ResultView: ",self.name)
    }
    
    var body: some View {
        
        VStack {
            Text("Hello, \(name)!")
            Text("Your lucky number is \(luckyNumber)!")
            Button(action: {
                self.showingAlert = true
            }) {
                Text("Show Lucky Advice")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Lucky advice for you!"), message: Text("Drink more water!"), dismissButton: .default(Text("Got it!")))
            }
        }
        
    }
}

struct ExtractedSubviewShowThemeImage: View {
    var body: some View {
        HStack{ Image("lucky")//https://favpng.com/png_view/lucky-block-drawings-clip-art-lucky-number-game-logo-png/UxEZYfxb#
                .resizable()
                .frame(alignment: .center)
                .scaledToFill()
                //                                    .clipShape(Circle())
                .shadow(radius: 10)
        }
    }
}
