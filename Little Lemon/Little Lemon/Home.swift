//
//  Home.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct Home: View {
    @State var tabSelection = 0
    var body: some View {
        TabView() {
            Menu().tabItem { Label("Menu", systemImage: "list.dash") }.tag(1)
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
