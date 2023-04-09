//
//  Onboarding.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

let defaults = UserDefaults.standard
struct Onboarding: View {
    
    @State var firstName: String = "";
    @State var lastName: String = "";
    @State var email: String = "";
    
    @State var showingError = false;
    @State var isLoggedIn:Bool = false;
    
    
    var body: some View {
        NavigationView {
            VStack{
                //parou aqui
                NavigationLink(destination: Home(), isActive: $isLoggedIn) { EmptyView() }
                
                
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("E-mail", text: $email)
                
                Button("Register") {
                    if(firstName.isEmpty == false &&
                       lastName.isEmpty == false &&
                       email.isEmpty == false){
                        defaults.set(firstName, forKey: "kFirstName")
                        defaults.set(lastName, forKey: "kLastName")
                        defaults.set(email, forKey: "kEmail")
                        defaults.set(true, forKey: "kIsLoggedIn")
                        defaults.synchronize()
                        
                        isLoggedIn.toggle()
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
            }.onAppear(){
                if(defaults.bool(forKey: "kIsLoggedIn") == true){
                    isLoggedIn = true;
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
