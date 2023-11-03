//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        VStack {
            Text("First Detail!")
            
            TextField("name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    FirstDetailView(viewModel: FirstTabViewModel() )
}
