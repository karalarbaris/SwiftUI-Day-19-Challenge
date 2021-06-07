//
//  ContentView.swift
//  SwiftUI-Day-19-Challenge
//
//  Created by Baris Karalar on 6.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var valueToBeConverted = ""
    @State private var inputType = ""
    @State private var outputType = ""
    
    let lenghtTypes = ["meters", "kilometers", "feet"]
    
    var result: Double {
        
        var length: Measurement<UnitLength>
        
        switch inputType {
        case "meters":
            length = Measurement(value: Double(valueToBeConverted) ?? 0, unit: UnitLength.meters)
        case "kilometers":
            length = Measurement(value: Double(valueToBeConverted) ?? 0, unit: UnitLength.kilometers)
        case "feet":
            length = Measurement(value: Double(valueToBeConverted) ?? 0, unit: UnitLength.feet)
        default:
            length = Measurement(value: Double(valueToBeConverted) ?? 0, unit: UnitLength.meters)
        }
        
        switch outputType {
        case "meters":
            return length.converted(to: UnitLength.meters).value
        case "kilometers":
            return length.converted(to: UnitLength.kilometers).value
        case "feet":
            return length.converted(to: UnitLength.feet).value
        default:
            return 0
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter value", text: $valueToBeConverted)
                    .keyboardType(.decimalPad)
                
                Picker("Input type", selection: $inputType) {
                    ForEach(lenghtTypes, id: \.self) { type in
                        Text("\(type)")
                    }
                }

                Picker("Output type", selection: $outputType) {
                    ForEach(lenghtTypes, id: \.self) { type in
                        Text("\(type)")
                    }
                }
                
                Text("Result: \(result, specifier: "%.2f")")
            }
        }
        
        
        
       
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
