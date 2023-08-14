//
//  CustomTabBar.swift
//  CustomAnimatedTabBar
//
//  Created by Dave on 12/08/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(selectedTab: $selectedTab, tabPoints: $tabPoints, image: "house")
            TabBarButton(selectedTab: $selectedTab, tabPoints: $tabPoints, image: "list.clipboard")
            TabBarButton(selectedTab: $selectedTab, tabPoints: $tabPoints, image: "gearshape")
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "list.clipboard":
                return tabPoints[1] 
            default:
                return tabPoints[2]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
