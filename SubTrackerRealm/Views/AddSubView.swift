//
//  AddSubView.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/17/22.
//

import SwiftUI

struct AddSubView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var string: String = ""
    @State private var renewDay: Int = 0
    @State private var renewDate = Date()
    @Environment(\.dismiss) var dismiss
    
    //Convert price string to double
    func priceToDouble() {
        price = Double(string)!
    }
    
    func dateToInt() {
        renewDay = Calendar.current.component(.day, from: renewDate)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("New Subscription")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .center)
            HStack {
                Text("Subscription   ")
                
                TextField("Enter the subscription here", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            }
            HStack {
                Text("Price              $")
                
                TextField("Enter price here", text: $string)
                    .textFieldStyle(.roundedBorder)

                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            }
            HStack {
                DatePicker("Renewal Date", selection: $renewDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20 )
                    .foregroundColor(Color("Background"))
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y:-8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                Button {
                    if title != "" {
                        priceToDouble()
                        dateToInt()
                        realmManager.addSub(subTitle: title, subPrice: price, subRenewalDay: renewDay)
                    }
                    dismiss()
                } label: {
                    Text("Add Sub")
                        .foregroundColor(Color("BasicColor"))
                        .padding()
                        .padding(.horizontal)
                        .cornerRadius(30)
                }
                
            }
            .frame(width: 300, height: 50)
            .padding(.leading, 33)
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color("Background"))
    }
}

struct AddSubView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubView()
            .environmentObject(RealmManager())
    }
}
