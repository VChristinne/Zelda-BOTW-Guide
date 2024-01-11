//
//  EquipmentView.swift
//  Zelda Guide
//
//  Created by Christinne on 11/01/2024.
//

import SwiftUI

struct CreatureView: View {
	@EnvironmentObject var vm: ViewModel
	@State private var uiImage: UIImage?
	
	let creature: Creature
	
	var body: some View {
		VStack {
			VStack {
				if let uiImage = uiImage {
					Image(uiImage: uiImage)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 120, height: 120)
				} else {
					ProgressView()
						.frame(width: 100, height: 120)
						.onAppear {
							loadUIImage()
						}
				}
			}
			.frame(width: 80)

			Text("\(creature.name.lowercased())")
				.font(.system(size: 16, weight: .black, design: .monospaced))
				.tint(.white)
				.shadow(color: .blue, radius: 2)
				.padding(.bottom, 3)
		}
	}
	
	private func loadUIImage() {
		guard let url = URL(string: "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/\(vm.getCreatureIndex(creature: creature))/image") else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				return
			}
			DispatchQueue.main.async {
				self.uiImage = UIImage(data: data)
			}
		}.resume()
	}
}

#Preview ("Sample Creature") {
	CreatureView(creature: Creature.sampleCreature)
		.environmentObject(ViewModel())
}
