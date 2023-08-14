//
//  Main.swift
//  CustomAnimatedTabBar
//
//  Created by Dave on 12/08/23.
//

import SwiftUI

struct Main: View {
    
    @State var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("MainColor")
                .ignoresSafeArea()
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
    
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
