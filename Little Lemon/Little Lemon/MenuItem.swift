//
//  MenuItem.swift
//  Little Lemon
//
//  Created by admin on 4/9/23.
//

import Foundation
struct MenuItem: Codable, Hashable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
