//
//  ContentView.swift
//  Animations
//
//  Created by Raul Banut on 16.11.2022.
//

import SwiftUI

final class ViewsStore: ObservableObject {
    static let standard = ViewsStore()
    
    @Published var views: [String] = ["Example 0", "Example 1", "Example 2", "Example 3", "Example 4", "Example 5.1", "Example 5.2", "Example 6"]
    
    func add(_ view: String) {
        views.append(view)
    }
    
    func remove(_ view: String) {
        views.removeAll(where: { $0 == view })
    }
}

struct FavoriteDetailView: View {
    
    let view: String
    
    var body: some View {
        VStack {
            Text("Opened favorite:")
            Text(view)
            Button("Remove from favorites") {
                ViewsStore.standard.remove(view)
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var viewsStore: ViewsStore = .standard
    
    var body: some View {
        NavigationView {
            List(viewsStore.views, id: \.self) { view in
                NavigationLink(view) {
                    switch view {
                    case "Example 0":
                        ContentZeroView()
                    case "Example 1":
                        ContentOneView()
                    case "Example 2":
                        ContentTwoView()
                    case "Example 3":
                        ContentThreeView()
                    case "Example 4":
                        ContentFourView()
                    case "Example 5.1":
                        MatchedGeometryView()
                    case  "Example 5.2":
                        OnboardingView()
                    case "Example 6":
                        ContentSixView()
                    default:
                        FavoriteDetailView(view: view)
                    }
                }
            }.navigationTitle("Examples")
        }
        //        ContentZeroView()
        
        //        ContentOneView()
        
        //        ContentTwoView()
        
        //        ContentThreeView()
        
        //        ContentFourView()
        //        ContentSixView()
        
        //        MatchedGeometryView()
        
        //        OnboardingView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
