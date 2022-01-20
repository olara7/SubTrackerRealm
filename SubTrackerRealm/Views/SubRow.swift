//
//  SubRow.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/17/22.
//

import SwiftUI

struct SubRow: View {
    var sub: String
    var price: Double
    var active: Bool
    var renewDay: Int
    @State private var date = Date()
    
    var body: some View {
        HStack {
            Image(systemName: active ? "checkmark.circle" : "circle")
                .padding(.leading)
            Text(sub)
                .font(.body).bold()
            Spacer()
            Text("$ \(String(price))")
                .font(.body).bold()
                .foregroundColor(.green)
            Text("\(Calendar.current.component(.month, from: date))/\(renewDay)")
                .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("Background"), lineWidth: 3))
                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y:-8)
                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
    }
}

struct SubRow_Previews: PreviewProvider {
    static var previews: some View {
        SubRow(sub: "Netflix", price: 15.49, active: true, renewDay: 16)
    }
}
