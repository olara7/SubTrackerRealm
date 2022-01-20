//
//  AddButton.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/17/22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color("Background"))
            .shadow(color: Color("LightShadow"), radius: 8, x: -8, y:-8)
            .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            Text("+")

                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("BasicColor"))
                
        }
        .frame(height: 50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
            
    }
}
