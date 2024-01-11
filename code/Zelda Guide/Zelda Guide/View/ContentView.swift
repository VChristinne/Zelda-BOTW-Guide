//
//  ContentView.swift
//  Zelda Guide
//
//  Created by Christinne on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			CreaturesView()
				.tabItem {
					Image(systemName: "lanyardcard")
					Text("Creatures")
				}
		}
		.accentColor(.blue)
		
	}
}


#Preview("Home", traits: .landscapeLeft) {
	ContentView()
}
