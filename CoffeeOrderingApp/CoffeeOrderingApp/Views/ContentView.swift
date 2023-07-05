//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListViewModel = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: orderListViewModel.orders)
                .navigationTitle("Coffee Orders")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: reloadOrders) {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: showAddCoffeeOrderView) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                }
            
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: $showModal)
                }
        }
    }
}

private extension ContentView {
    func reloadOrders() {
        orderListViewModel.fetchOrders()
    }
    
    func showAddCoffeeOrderView() {
        showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
