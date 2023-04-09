//
//  UserProfile.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct UserProfile: View {
    let name = defaults.string(forKey: "kFirstName");
    let lastName = defaults.string(forKey: "kLastName");
    let email = defaults.string(forKey: "kEmail");
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal Information")
                .font(.title)
            UserImage()
            Text("Name:").bold()
            Text(name ?? "nil")
            
            Text("Last Name:").bold()
            Text(lastName ?? "nil")
            
            Text("E-Mail:").bold()
            Text(email ?? "nil")
            
            Button("Logout") {
                defaults.set(false, forKey: "kIsLoggedIn");
                self.presentation.wrappedValue.dismiss()
                
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
