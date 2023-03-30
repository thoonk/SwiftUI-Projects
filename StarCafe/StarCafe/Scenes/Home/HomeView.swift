//
//  HomeView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            HomeHeaderView(isNeedToReload: $viewModel.isNeedToReload)
            MenuSuggestSectionView(coffeeMenu: $viewModel.coffeeMenu)
            Spacer(minLength: 32.0)
            EventSectionView(events: $viewModel.events)
        }
        .refreshable {
            viewModel.events.shuffle()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
