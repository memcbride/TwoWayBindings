//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Mark McBride on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Press Count: \(pressCount)")
                    .font(.largeTitle)
                
                Button("Press Me") {
                    pressCount += 1
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                TextField("Enter a name",text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Name entered \(name)")
                
                Spacer()
                
                Toggle("Toggle is \(toggleIsOn ? "on" : "off"):", isOn: $toggleIsOn)
                
                Spacer()
            }
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a rectangle color:", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in:  1...10)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
