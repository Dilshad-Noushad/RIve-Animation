//
//  Menu.swift
//  RIveAnimation
//
//  Created by Dilshad N on 18/07/22.
//

import SwiftUI

struct MenuItemRow: View {
    
    
    @Binding var selectedMenuItem: SelectedMenu
    var item: MenuItem
    
    var body: some View {
        HStack(spacing: 14) {
            item.icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.6)
            Text(item.text)
                .customFont(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenuItem == item.menu ? .infinity : 0)
            
            // To animate the selection from left to right
                .frame(maxWidth: .infinity, alignment: .leading)
        )
        // help to select the item entire the cell
        .background(Color("Background 2"))
        .onTapGesture {
            item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                item.icon.setInput("active", value: false)
            }
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                selectedMenuItem = item.menu
            }
        }

    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(selectedMenuItem: .constant(.home), item: menuItems[0])
    }
}
