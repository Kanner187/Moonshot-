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
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical){
                VStack{
                    Image("\(self.mission.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.7)
                    .padding(.top)
                    
                    Text("\(self.mission.description)")
                        .padding()
                    
                    Spacer(minLength: 25)
                    
                }
            }
        }
        .navigationBarTitle("\(mission.displayName)" , displayMode: .inline)
    }
}

struct MissionsView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionsView(mission: missions[0])
    }
}
