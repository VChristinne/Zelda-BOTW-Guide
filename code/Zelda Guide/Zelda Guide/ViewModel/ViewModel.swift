//
//  EquipmentViewModel.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
	private let creatureManager = CreatureManager()
	
	@Published var creatureList = [Creature]()
	@Published var creatureDetails: DetailCreature?
	@Published var searchText = ""
	
	var filteredCreature: [Creature] {
		return searchText == "" ? creatureList : creatureList.filter {
			$0.name.contains(searchText.lowercased())
		}
	}
	
	init() {
		self.creatureList = creatureManager.getCreature()
	}
	
	func getCreatureIndex(creature: Creature) -> Int {
		if let index = self.creatureList.firstIndex(of: creature) {
			return index + 1
		}
		return 0
	}
	
	func getDetails(creature: Creature) {
		let id = getCreatureIndex(creature: creature)
		
		self.creatureDetails = DetailCreature(id: 0, category: "", description: "", dlc: false)
		
		creatureManager.getDetailedCreature(id: id) { data in
			DispatchQueue.main.async {
				self.creatureDetails = data
			}
		}
	}
}
