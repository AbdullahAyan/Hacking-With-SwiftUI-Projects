//
//  ContentView.swift
//  Challenge1
//
//  Created by Abdullah Ayan on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State var inputUnit = UnitLength.meters
    @State var input: Double  = 0.0
    
    @State var outputUnit = UnitLength.feet
    var output: Double {
        let measurment = Measurement(value: input, unit: inputUnit)
        
        return measurment.converted(to: outputUnit).value
    }
    
    let units : [UnitLength] = [.meters, .feet, .kilometers, .yards]
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self ) {
                            Text($0.symbol)
                        }
                    }
                    
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self ) {
                            Text($0.symbol)
                        }
                    }
                }

                Section {
                    TextField("Input", value: $input, format: .number)
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text("\(output) \(outputUnit.symbol)")
                } header: {
                    Text("Output")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
