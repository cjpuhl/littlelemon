//
//  MenuList.swift
//  Little Lemon
//
//  Created by admin on 4/9/23.
//

import Foundation
import CoreData


struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext){
        PersistenceController.shared.clear()

        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request){ data, response, error in
            let decoder = JSONDecoder()
            if let data = data,
               let fullMenu = try? decoder.decode(MenuList.self, from: data){
                    for menuItem in fullMenu.menu{
                        let newDish = Dish(context: viewContext)
                        newDish.title = menuItem.title
                        newDish.details = menuItem.description
                        newDish.price = Double(menuItem.price) ?? 0.00
                        newDish.image = menuItem.image
                        newDish.category = menuItem.category
                }
                try? viewContext.save()
                
            }
        }
        dataTask.resume()
    }
}
