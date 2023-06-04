//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by NazarStf on 04.06.2023.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject private var orderListVM = OrderListViewModel()
	
	var body: some View {
		
		NavigationView {
			OrderListView(orders: self.orderListVM.orders)
				.navigationBarTitle("Coffee Orders")
		}
		 
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
