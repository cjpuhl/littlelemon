//
//  DishDetails.swift
//  Little Lemon
//
//  Created by admin on 4/16/23.
//

import SwiftUI

struct DishDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        VStack{
            Text(dish.title ?? "").font(.title)
            Text(dish.category ?? "").font(.title2)
            AsyncImage(url: URL(string: dish.image!)) { image in
                image.resizable()
                    .scaledToFit()
                } placeholder: {
                ProgressView()
            }
            
            .clipShape(Rectangle())
            Text(dish.details ?? "")
            Text(NumberFormatter.localizedString(from: dish.price as NSNumber, number: .currency))
                .font(Font.body.bold())
            Spacer()
        }
    }
}

/*struct DishDetails_Previews: PreviewProvider {
    static var previews: some View {
        DishDetails()
    }
}*/
