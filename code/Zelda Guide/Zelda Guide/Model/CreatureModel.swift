//
//  EquipmentModel.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import Foundation

struct CreaturePage: Codable {
	let results: [Creature]
}

struct Creature: Codable, Identifiable, Equatable {
	let id = UUID()
	let name: String
	let url: String
	
	static var sampleCreature = Creature(name: "horse", url: "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/1")
}

struct DetailCreature: Codable {
	let id: UInt
	let name: String
	let category: String
	// let common_locations: [String]
	let description: String
	let dlc: Bool
	// let proporties: [String]
}
