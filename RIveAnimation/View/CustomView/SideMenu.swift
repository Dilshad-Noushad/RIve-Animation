//
//  SideMenu.swift
//  RIveAnimation
//
//  Created by Dilshad N on 18/07/22.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    
    @State var selectedMenuItem: SelectedMenu = .home
    @State var isDarkMode = false
    
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("David")
                        .customFont(.body)
                    Text("Asst Professor")
                        .customFont(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
//MARK: MenuItemRow
                    MenuItemRow(selectedMenuItem: $selectedMenuItem, item: item)
                    
                }
            }
            .padding(8)
            
            Text("HISTORY")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuItemRow(selectedMenuItem: $selectedMenuItem, item: item)
                    
                }
            }
            .padding(8)
            
            Spacer()
         //MARK: DarkMode Toggle
            HStack(spacing: 14) {
                menuItems3[0].icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                // To change the dark mode icon animation
                    .onChange(of: isDarkMode) { newValue in
                        if newValue {
                            menuItems3[0].icon.setInput("active", value: true)
                        } else {
                            menuItems3[0].icon.setInput("active", value: false)
                        }
                    }
                Text(menuItems3[0].text)
                    .customFont(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
            
            
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}


struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
    MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notifications)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkmode)
]

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkmode
}
