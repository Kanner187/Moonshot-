//
//  DetailsView .swift
//  MoonShot
//
//  Created by Levit Kanner on 08/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DetailsView_: View {
    var missions: [Mission]
    var astronauts: [Astronaut]
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailsView__Previews: PreviewProvider {
    static var previews: some View {
        DetailsView_(missions: [], astronauts: [])
    }
}
