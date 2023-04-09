//
//  UserImage.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct UserImage: View {
    var body: some View {
        VStack{
            Image("Profile")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage()
    }
}
