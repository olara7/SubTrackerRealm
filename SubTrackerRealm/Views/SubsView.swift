//
//  SubsView.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/17/22.
//

import SwiftUI

struct SubsView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var renewDate = Date()
    
    
    var body: some View {
        VStack {
            Text("Active Subscriptions")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            List {
                ForEach(realmManager.subs, id: \.id) {
                    sub in
                    if !sub.isInvalidated {
                        SubRow(sub: sub.title, price: sub.price, active: sub.active, renewDay: sub.renewDay)
                            .onTapGesture {
                                realmManager.updateSub(id: sub.id, active: !sub.active)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteSub(id: sub.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
            }
            
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(Color("Background"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y:-8)
        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
    }
}

struct SubsView_Previews: PreviewProvider {
    static var previews: some View {
        SubsView()
            .environmentObject(RealmManager())
    }
}
