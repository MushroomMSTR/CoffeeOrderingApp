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
	
	var body: some View {
		
		NavigationView {
		
		OrderListView(orders: self.orderListVM.orders)
		 
			.navigationBarTitle("Coffee Orders")
			.navigationBarItems(leading: Button(action: reloadOrders) {
				Image(systemName: "arrow.clockwise")
					.foregroundColor(Color.white)
				}, trailing: Button(action: showAddCoffeeOrderView){
					Image(systemName: "plus")
						.foregroundColor(Color.white)
			})
		  
			
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
	

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
