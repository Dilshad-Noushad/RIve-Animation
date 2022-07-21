//
//  ContentView.swift
//  RIveAnimation
//
//  Created by Dilshad N on 17/07/22.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State private var isOpen = false
    @State private var showOnboarding = false
    
    
    var body: some View {
        ZStack {
            
            Color("Background 2")
                .ignoresSafeArea()
            
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
            
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("user")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .ignoresSafeArea()
            
            // MARK: Profile icon
            Button {
                withAnimation(.spring()) {
                    showOnboarding = true
                }
                
            } label: {
                Image(systemName: "person")
                    .frame(width: 36, height: 36)
                    .foregroundColor(.black)
                    .background(.white)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .padding()
                    .offset(y: 4)
                    .offset(x: isOpen ? 100 : 0) // to hide the button while side menu is open
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            menuButton.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                        isOpen.toggle()
                    }
                    
                }
            //MARK: To change the status bar color. also do some change in info.plist(View controller-based status bar appearance = NO)
                .onChange(of: isOpen) { newValue in
                    if newValue {
                        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
                    } else {
                        UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    }
                }
            
            TabBar()
                .offset(y: isOpen ? 300 : 0) // To hide tab bar while side menu is open
            //    .offset(y: isOpen ? 200 : 0)
              //  .offset(y: -24)
            
            // comment this to see the change also the offset(y: -24)
//                .background(
//                    LinearGradient(colors: [Color("Background").opacity(0), Color("Background")], startPoint: .top, endPoint: .bottom)
//                        .frame(height: 150)
//                        .frame(maxHeight: .infinity, alignment: .bottom)
//                        .allowsHitTesting(false)
//                )
//                .ignoresSafeArea()
            
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
                    .background(.white)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
