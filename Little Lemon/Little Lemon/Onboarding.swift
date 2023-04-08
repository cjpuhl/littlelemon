//
//  Onboarding.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

let kFirstName = "first name key";
let kLastName = "last name key";
let kEmail = "email key";

struct Onboarding: View {
    
    @State var firstName: String = "";
    @State var lastName: String = "";
    @State var email: String = "";
    @State var showingError = false;
    
    var body: some View {
        VStack{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("E-mail", text: $email)
            Button("Register") {
                if(firstName.isEmpty == false &&
                   lastName.isEmpty == false &&
                   email.isEmpty == false){
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                }else{
                    showingError.toggle()
                }
            }
            
            .alert("ERROR", isPresented: $showingError, actions: {
                Button("OK", role: .cancel) {showingError.toggle()
                }
            }, message: {
                Text("Missing Information.")
            })
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
