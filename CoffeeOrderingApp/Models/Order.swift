//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by NazarStf on 04.06.2023.
//

import Foundation

struct Order: Codable {
	let name: String
	let size: String
	let coffeeName: String
	let total: Double
}
