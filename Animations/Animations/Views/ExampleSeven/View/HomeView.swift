//
//  HomeView.swift
//  Animations
//
//  Created by Raul Banut on 02.12.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(
                alignment: .leading,
                spacing: 15,
                pinnedViews: [.sectionHeaders]) {
                    
                    // Parallax Header ...
                    
                    GeometryReader { reader -> AnyView in
                        let offset = reader.frame(in: .global).minY
                        
                        if -offset >= 0 {
                            DispatchQueue.main.async {
                                self.viewModel.offset = -offset
                            }
                        }
                        
                        return AnyView(
                            Image("pizza")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: 250)
                    
                    // Cards...
                    
                    Section(header: HeaderView()) {
                        ForEach(tabsItems) { tab in
                            VStack(alignment: .leading, spacing: 15) {
                                Text(tab.tab)
                                    .font(.title2)
                                    .bold()
                                
                                ForEach(tab.foods) { food in
                                    CardView(food: food)
                                }
                            }
                            
                            Divider()
                        }
                    }
                }
        }
        .overlay(alignment: .top) {
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .opacity(viewModel.offset > 250 ? 1 : 0)
                .ignoresSafeArea(.all, edges: .top)
        }
        .environmentObject(viewModel)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
