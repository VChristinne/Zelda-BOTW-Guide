//
//  EquipmentsView.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import SwiftUI

struct CreaturesView: View {
	@StateObject var vm = ViewModel()
	
	private let adaptiveColumns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptiveColumns, spacing: 10) {
					ForEach(vm.filteredCreature) { creature in
						NavigationLink(destination: CreatureDetailView(creature: creature)) {
							CreatureView(creature: creature)
						}
					}
				}
				.animation(.easeIn(duration: 0.3), value: vm.filteredCreature.count)
				.navigationTitle("Creatures")
				.navigationBarTitleDisplayMode(.automatic)
			}
			.searchable(text: $vm.searchText)
		}
		.environmentObject(vm)
	}
}

#Preview {
    ContentView()
}
