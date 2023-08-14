//
//  TabBarButton.swift
//  CustomAnimatedTabBar
//
//  Created by Dave on 12/08/23.
//

import SwiftUI

struct TabBarButton: View {
    
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var image: String
    
    var body: some View {
        GeometryReader{ reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            return AnyView(
                Button {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                } label: {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("MainColor"))
                        .offset(y: selectedTab == image ? -10 : 0)
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity))
        }
        .frame(height: 50)
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
