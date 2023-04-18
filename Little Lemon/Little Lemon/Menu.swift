//
//  Menu.swift
//  Little Lemon
//
//  Created by admin on 4/8/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""

    var body: some View {
        VStack{
            Text("Title");
            Text("Location");
            Text("Short Description");
            
            TextField("Search Menu", text: $searchText)
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()
                           
            ) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.self){ dish in
                        NavigationLink(destination: DishDetails(dish: dish)){
                            HStack{
                                VStack{
                                    Text(dish.title ?? "")
                                    
                                    Text(NumberFormatter.localizedString(from: dish.price as NSNumber, number: .currency))
                                }
                                Spacer()
                                AsyncImage(url: URL(string: dish.image!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(maxWidth: 90, maxHeight: 90)
                                
                                .clipShape(Rectangle())
                            }
                        }
                    }
                }
            }
        }
        .onAppear(){
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
    private func buildPredicate() -> NSPredicate {
        if(searchText.isEmpty == true){
            return NSPredicate(value: true)
        }else /*if (searchText.isEmpty == false)*/{
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
            [NSSortDescriptor(key: "title",
                              ascending: true,
                              selector:
                                #selector(NSString.localizedStandardCompare))]
        }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
