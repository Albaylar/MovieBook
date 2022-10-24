//
//  Loadinig View.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 24.10.2022.
//

import SwiftUI

struct Loadinig_View: View {
    
    @Binding var stepper : Int?

    var body: some View {
        VStack{
            Text("Furkan Deniz Albaylar")
            Stepper(value: 0, in: $stepper) {
                Text("Lan")
            }
        }
    }
}

struct Loadinig_View_Previews: PreviewProvider {
    static var previews: some View {
        Loadinig_View(stepper: 50)
    }
}
