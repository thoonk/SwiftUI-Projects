//
//  PortfolioView.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/13/25.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                       Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButtons
                }
            })
            .onChange(of: viewModel.searchText) { value in
                if value == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
    
    struct CoinItemView: View {
        let coin: CoinModel
        
        let isSelected: Bool
        let onTap: () -> Void
        
        var body: some View {
            CoinLogoView(coin: coin)
                .frame(width: 75)
                .padding(4)
               .onTapGesture {
                    onTap()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.theme.green : Color.clear, lineWidth: 1)
                )
        }
    }
}

private extension PortfolioView {
    var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.searchText.isEmpty ? viewModel.portfolioCoins : viewModel.allCoins) { coin in
                    CoinItemView(
                        coin: coin,
                        isSelected: selectedCoin?.id == coin.id,
                        onTap: {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        })
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = viewModel.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount in your portfolio:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Currnet value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .withoutAnimation()
        .padding()
        .font(.headline)
    }
    
    var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            
            Button(action: {
                saveButtonPressed()
            }) {
                Text("Save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ?
                1.0 : 0.0
            )
        }
        .font(.headline)
    }
    
    func saveButtonPressed() {
        guard let coin = selectedCoin,
              let amount = Double(quantityText)
        else { return }
        
        viewModel.updatePortfolio(coin: coin, amount: amount)
        
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    func removeSelectedCoin() {
        selectedCoin = nil
        viewModel.searchText = ""
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeViewModel)
    }
}
