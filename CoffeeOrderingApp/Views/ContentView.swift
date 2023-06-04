//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by NazarStf on 04.06.2023.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject private var orderListVM = OrderListViewModel()
	@State private var showModal: Bool = false
	
	init() {
		configureNavigationBarAppearance()
	}
	
	var body: some View {
		NavigationView {
			OrderListView(orders: self.orderListVM.orders)
				.navigationBarTitle("Coffee Orders")
				.navigationBarItems(
					leading: Button(action: reloadOrders) {
						Image(systemName: "arrow.clockwise")
							.foregroundColor(Color.white)
					},
					trailing: Button(action: showAddCoffeeOrderView) {
						Image(systemName: "plus")
							.foregroundColor(Color.white)
					}
				)
				.sheet(isPresented: self.$showModal) {
					AddCoffeeOrderView(isPresented: self.$showModal)
				}
		}
	}
	
	private func reloadOrders() {
		self.orderListVM.fetchOrders()
	}
	
	private func showAddCoffeeOrderView() {
		self.showModal = true
	}
	
	private func configureNavigationBarAppearance() {
		let starbucksGreen = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
		
		UINavigationBar.appearance().backgroundColor = starbucksGreen
		UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
	}

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
