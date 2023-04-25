//
//  HeaderView.swift
//  Animations
//
//  Created by Raul Banut on 02.12.2022.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 0) {
                if viewModel.offset > 250 {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: getSize(), height: getSize())
                            .foregroundColor(.primary)
                    }
                }
                
                Text("Recipes")
                    .font(.title)
                    .bold()
            }
            
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Italian . Romanian . American")
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30/40 Min")
                            .font(.caption)
                        
                        Text("4.3")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        Text("$6.4 Fee")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .opacity(viewModel.offset > 200 ? 1 - Double((viewModel.offset - 200) / 50) : 1)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(tabsItems) { tab in
                            Text(tab.tab)
                                .font(.caption)
                                .foregroundColor(viewModel.selectedTab == tab.tab ? .white : .black)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(.primary.opacity(viewModel.selectedTab == tab.tab ? 1 : 0))
                                .clipShape(Capsule())
                                
                        }
                    }
                }
                .opacity(viewModel.offset > 200 ? Double((viewModel.offset - 200) / 50) : 0)
            }
            .frame(height: 60)
            
            if viewModel.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(.white)
    }
    
    func getSize() -> CGFloat {
        if viewModel.offset > 200 {
            let progress = (viewModel.offset - 200) / 50
            
            if progress <= 1.0 {
                return progress * 40
            } else {
                return 40
            }
        } else {
            return 0
        }
    }
}

#if DEBUG
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
