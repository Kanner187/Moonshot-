//
//  DetailsView.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    var astronaut: Astronaut
    var mission: Mission
    var body: some View {
        ScrollView{
            VStack{
                GeometryReader{geo in
                    Image("\()")
                    
                }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(astronaut: [], mission: [])
    }
}
