//
//  AstronautView.swift
//  MoonShot
//
//  Created by Levit Kanner on 09/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let mission: Mission
    @State private var popview = false
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView(.vertical, showsIndicators: true) {
                VStack{
                    ZStack{
                        Image("\(self.astronaut.id)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width)
                            .onLongPressGesture {
                                self.popview = true
                        }
                        
                        
                        if self.popview{
                            Text("\(self.astronaut.id)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(10)
                        }
                    }
                    
                    Section(header: Text("About \(self.astronaut.name)")
                        .font(.headline)) {
                            Text("\(self.astronaut.description)")
                    }
                    .layoutPriority(1)
                    .padding()
                    
                    Section(header:Text("Mission")
                        .font(.headline)){
                            Text("\(self.mission.displayName)")
                                .foregroundColor(.purple)
                    }
                    
                }
            }
            .navigationBarTitle("\(self.astronaut.name)" , displayMode: .inline)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], mission: missions[0])
    }
}
