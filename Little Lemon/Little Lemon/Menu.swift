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
    @State private var menuLoaded = false
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Little lemon").font(.title)
                    Text("Chicago").font(.title2);
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.");
                }
                Spacer()
                Image("Hero")
                    .resizable()
                    .frame(width: 200, height: 200)
                
            }
            Divider()
            
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
        .task {
                        if !menuLoaded {
                            await MenuList.getMenuData(viewContext: viewContext)
                        }
                        menuLoaded = true
        /*.onAppear(){
            MenuList.getMenuData(viewContext: viewContext)*/
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
