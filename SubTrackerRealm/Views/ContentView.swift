//
//  ContentView.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddSubView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            SubsView()
                .environmentObject(realmManager)
            AddButton()
                .padding()
                .onTapGesture {
                    showAddSubView.toggle()
                }
        }
        .sheet(isPresented: $showAddSubView) {
            AddSubView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
