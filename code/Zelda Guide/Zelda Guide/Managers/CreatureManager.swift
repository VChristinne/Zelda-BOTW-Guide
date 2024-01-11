//
//  EquipmentManager.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import Foundation

class CreatureManager {
	func getCreature() -> [Creature] {
		let data: CreaturePage = Bundle.main.decode(file: "creatures.json")
		let creature: [Creature] = data.results
		
		return creature
	}
	
	func getDetailedCreature(id: Int, _ completion: @escaping (DetailCreature) -> ()) {
		Bundle.main.fetchData(url: "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/\(id)/", model: DetailCreature.self) { data in
			completion(data)
		} failure: { error in
			print(error)
		}
	}
}
