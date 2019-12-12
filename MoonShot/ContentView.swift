//
//  ContentView.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingLaunchDate = false
    //Properties
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    //Body definition
    var body: some View {
        NavigationView {
            List(missions){ mission in
                NavigationLink(destination: MissionsView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:44 , height: 44)
                    
                    VStack(alignment: .leading){
                        Text("\(mission.displayName)")
                            .fontWeight(.bold)
                        if self.showingLaunchDate{
                           Text("\(mission.formattedDate)")
                            .font(.system(size: 12))
                        }else{
                            HStack(spacing:5){
                                ForEach(0..<mission.crew.count){
                                    Text("\(mission.crew[$0].name),")
                                        .font(.system(size: 12))
                                }
                            }
                        }
                        
                    }
                }
                
            }
        .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(action: {
                self.showingLaunchDate.toggle()
            }){
                Text(showingLaunchDate ? "Show Crew" : "Show Dates")
            })
        }
        
    }
    
    //Methods
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
