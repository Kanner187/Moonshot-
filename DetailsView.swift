//
//  DetailsView.swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    var astronauts: [Astronaut]
    var missions: [Mission]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(astronauts: [], missions: [])
    }
}
