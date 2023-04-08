//
//  Menu.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Title");
            Text("Location");
            Text("Short Description");
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
