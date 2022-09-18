//
//  ContentView.swift
//  Shared
//
//  Created by suhail on 23/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var length = 0.0
    @State  private var units = ["km","meter","feet","yard","miles"]
    
   // @FocusState private var amountIsFocused : Bool
    
    var converted: Double{
        var len = 0.0
        var flen = len

        //converting all input units to feet [baseunit]
        func convertToBase()->Double{
        if inputUnit=="km"{
            len = length*3280.84
        }
        
        else if inputUnit=="meter"{
          len = length*3.28084
        }
      
        else if inputUnit=="feet"{
           len = length
        }
        else if inputUnit=="yard"{
            len = length*3
        }
        else {
            len = length*5280
        }
            return len
        }
        
        func convertToOutput(len: Double)->Double{
        if outputUnit=="km"{
            flen=len/3281
        }
        
        else if outputUnit=="meter"{
            flen=len/3.281
        }
       
        else if outputUnit=="feet"{
            flen=len
        }
        else if outputUnit=="yard"{
            flen = len/3
        }
        else {
            flen=len/5280
        }
        return flen
        
        
    }
    let go=convertToBase()
    let get = convertToOutput(len: go)
        return get
    }
   
        
        
    
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                Picker("Select the input format: ",selection: $inputUnit){
                ForEach(units, id: \.self){
                    Text($0)
                }
                
                }.pickerStyle(.segmented)
                
                }header: {
                    Text("Select the input unit")
                }
                Section{
                    TextField("", value: $length, format: .number)
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Enter any length in \(inputUnit) ")
                }
                
                Section{
                Picker("Select the output format: ",selection: $outputUnit){
                ForEach(units, id: \.self){
                    Text($0)
                }
                
                }.pickerStyle(.segmented)
                
                }header: {
                    Text("Select the  output unit")
                }
                
                
                
                Section{
                    Text(converted,format: .number)
                }header: {
                    Text("Lenght in \(outputUnit) ")
                }
            
            }.navigationTitle("Multi Converter")
                .navigationBarTitleDisplayMode(.inline)
  }
 }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

