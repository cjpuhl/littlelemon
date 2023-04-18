//
//  Home.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct Home: View {
    @State var tabSelection = 0
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView() {
            Menu().tabItem { Label("Menu", systemImage: "list.dash") }.tag(1)
            UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil")}.tag(2)
        }.navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistence.container.viewContext)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
