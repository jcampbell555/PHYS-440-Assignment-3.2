//
//  ContentView.swift
//  Shared
//
//  Created by Joshua Campbell  on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var guess = ""
    @State private var totalIterations: Int? = 5
    @State private var cesaroAngle: Int? = 4
    @State var editedCesaroAngle: Int? = 4
    @State var editedTotalIterations: Int? = 5
    @State var viewArray :[AnyView] = []
    //added shit
    @State private var meanFP: Int? = 1
    @State private var EnergyI: Int? = 100
    @State private var EnergyLoss: Int? = 10
    @State var boxHeight: Int? = 5
    @State var boxWidth: Int? = 5
    @State var editedboxHeight: Int? = 5
    @State var editedboxWidth: Int? = 5
    
        
    private var intFormatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            return f
        }()
        
        var body: some View {
        
           VStack {
               VStack{
            
            ZStack {
                
                CesaroView(iterationsFromParent: $totalIterations, angleFromParent: $cesaroAngle, meanFPFromParent:$meanFP, EnergyIFromParent: $EnergyI, EnergyLossFromParent: $EnergyLoss).drawingGroup()
                    
                // Stop the window shrinking to zero.
                Spacer()
            }.frame(minHeight: 600, maxHeight: 600)
                       .frame(minWidth: 600, maxWidth: 600)
               }
            
            VStack{
                HStack{
                    
                    Text(verbatim: "Wall Height")
                    .padding()
                    TextField("Number of Iterations (must be between 0 and 7 inclusive)", value: $editedboxHeight, formatter: intFormatter, onCommit: {
                        self.boxHeight = self.editedboxHeight
                    })
                
                        .padding()
                    
                    }
                
                VStack{
                    HStack{
                        
                        Text(verbatim: "Wall Width")
                        .padding()
                        TextField("Number of Iterations (must be between 0 and 7 inclusive)", value: $editedboxWidth, formatter: intFormatter, onCommit: {
                            self.boxWidth = self.editedboxWidth
                        })
                    
                            .padding()
                        
                        }
                
                HStack{
                    
                    Text(verbatim: "Angle π/number:")
                    .padding()
                    TextField("The angle of the Fractal is π/number entered. Must be between 1 and 50.", value: $editedCesaroAngle, formatter: intFormatter, onCommit: {
                        self.cesaroAngle = self.editedCesaroAngle
                    })
                
                        .padding()
                    
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
}
