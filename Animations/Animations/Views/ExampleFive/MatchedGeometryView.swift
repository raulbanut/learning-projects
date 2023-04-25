//
//  MatchedGeometryView.swift
//  Animations
//
//  Created by Raul Banut on 23.11.2022.
//

import SwiftUI

struct MatchedGeometryView: View {
    @State private var isProfileExpanded = false
    
    @Namespace private var matchedAnimation
    
    var body: some View {
        VStack {
            if isProfileExpanded {
                expandedProfile
            } else {
                collapsedProfile
            }
            
            videoList
        }
    }
    
    var profileImage: some View {
        Image("thumb")
            .resizable()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isProfileExpanded.toggle()
                }
            }
    }
    
    var collapsedProfile: some View {
        HStack {
            profileImage
                .matchedGeometryEffect(id: "Image", in: matchedAnimation)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text("Animal")
                    .font(.title)
                    .bold()
                    .matchedGeometryEffect(id: "Name", in: matchedAnimation)
                
                Text("Savana")
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "Place", in: matchedAnimation)
            }
            
            Spacer()
        }
        .padding()
    }
    
    var expandedProfile: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: "Image", in: matchedAnimation)
                .frame(width: 130, height: 130)
            
            VStack {
                Text("Animal")
                    .font(.title)
                    .bold()
                    .matchedGeometryEffect(id: "Name", in: matchedAnimation)
                
                Text("Savana")
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "Place", in: matchedAnimation)
                
                Text("Aici incercam chestii")
            }
            
            Spacer()
        }
        .padding()
    }
    
    var videoList: some View {
        VStack {
            Spacer()
            
            Rectangle()
                .ignoresSafeArea()
        }
    }
}

struct MatchedGeometryView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryView()
    }
}
