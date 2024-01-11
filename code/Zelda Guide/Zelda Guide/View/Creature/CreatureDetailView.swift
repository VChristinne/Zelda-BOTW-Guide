//
//  EquipmentDetailView.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import SwiftUI

struct CreatureDetailView: View {
	@EnvironmentObject var vm: ViewModel
	let creature: Creature
	
	var body: some View {
		
		VStack {
			CreatureView(creature: creature)
			
			VStack(spacing: 10) {
				Text("**ID**: \(vm.creatureDetails?.id ?? 0)")
				Text("**Name**: \(vm.creatureDetails?.name ?? "")")
				Text("**Description**: \(vm.creatureDetails?.description ?? "")")
			}
		}
		.onAppear {
			vm.getDetails(creature: creature)
		}
	}
}

#Preview("Creature Detail") {
	CreatureDetailView(creature: Creature.sampleCreature)
		.environmentObject(ViewModel())
}
