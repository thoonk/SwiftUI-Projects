//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/05.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Enter name", text: $addCoffeeOrderViewModel.name)
                    } header: {
                        Text("INFORMATION").font(.body)
                    }
                    
                    Section {
                        ForEach(addCoffeeOrderViewModel.coffeeList, id:\.name) {
                            coffee in
                            
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderViewModel .coffeeName)
                        }
                    } header: {
                        Text("SELECT COFFEE").font(.body)
                    }
                    
                    Section {
                        Picker("", selection: $addCoffeeOrderViewModel.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    } header: {
                        Text("SELECT COFFEE").font(.body)
                    } footer: {
                        OrderTotalView(total: addCoffeeOrderViewModel.total)
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        addCoffeeOrderViewModel.placeOrder()
                        isPresented = false
                    }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                        .foregroundColor(.white)
                        .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                        .cornerRadius(10)
                }
                .navigationTitle("Add Order")
            }
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: selection == coffee.name ? "checkmark" : "").padding()
        }
        .onTapGesture {
            selection = coffee.name
        }
    }
}
