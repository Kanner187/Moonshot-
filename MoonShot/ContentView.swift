//
//  ContentView.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //Properties
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    //Body definition
    var body: some View {
        NavigationView {
            List(missions){ mission in
                NavigationLink(destination: MissionsView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:44 , height: 44)
                    VStack(alignment: .leading){
                        Text("\(mission.displayName)")
                            .fontWeight(.bold)
                        Text("\(mission.formattedDate)")
                            .font(.system(size: 12))
                    }
                }
                
            }
        .navigationBarTitle("Moonshot")
        }
        
    }
    
    //Methods
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
