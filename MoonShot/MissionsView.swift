//
//  MissionsView.swift
//  MoonShot
//
//  Created by Levit Kanner on 09/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct MissionsView: View {
    //Properties
    let mission: Mission
    let astronauts: [CrewMember]
    
    //Resolved Astronauts
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical){
                VStack{
                    Image("\(self.mission.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.7)
                    .padding(.top)
                    Text("\(self.mission.formattedDate)")
                    
                    Text("\(self.mission.description)")
                        .padding()
                    
                    Spacer(minLength: 25)
                    Section(header: Text("Crew")
                        .font(.headline)
                        .underline()) {

                ForEach(self.astronauts , id: \.role){crewMember in
                    NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut , mission: self.mission)){
                        HStack{
                            Image("\(crewMember.astronaut.id)")
                            .resizable()
                                .frame(width: 93 , height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.primary, lineWidth: 1))
                            
                            VStack(alignment: .leading){
                                Text("\(crewMember.astronaut.name)")
                                    .font(.headline)
                                Text("\(crewMember.role)")
                                    .font(.system(size: 15))
                                    .foregroundColor(crewMember.role.hasPrefix("Commander") ? .red : .green)
                            }
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                        
                    }
                    }
                }
            }
        }
        .navigationBarTitle("\(mission.displayName)" , displayMode: .inline)
    }
    
    init(mission: Mission , astronauts: [Astronaut]){
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }){
                matches.append(CrewMember(role: member.role, astronaut: match))
            }else{
                fatalError("Missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
}

struct MissionsView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionsView(mission: missions[0], astronauts: astronauts)
    }
}
