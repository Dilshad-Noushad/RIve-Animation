//
//  OnboardingView.swift
//  RIveAnimation
//
//  Created by Dilshad N on 17/07/22.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    @State private var showModal = false
    @Binding var showOnboarding: Bool
    
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            
            background
            
            content
                .offset(y: showModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
            
        //MARK: Close button
            Button {
                showOnboarding = false
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .padding()
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
        }
    }
    
    //MARK: Background
    var background: some View {
        
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius:50)
                    .offset(x: 200, y: 100))
    }
    
    //MARK: Content
    var content: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn to Code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 236, alignment: .leading)
            
            Text("This course was written for designers and developers who are passionate about design and about building real apps for iOS, iPadOS, macOS, tvOS and watchOS.")
                .customFont(.body)
                .opacity(0.7)
            //  .frame(width: .infinity, alignment: .leading)
            Spacer()
            
            //MARK: Button
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the Course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline))
                .background(Color.black
                    .cornerRadius(30)
                    .opacity(0.2)
                    .offset(x: 2, y:5))
            //MARK: onTap
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    }
                }
            
            Text("Course includes access to 10+ swiftui handbooks, 100+ tutorials, 120+ hours of videos, source file and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView(showOnboarding: .constant(false))
            OnboardingView(showOnboarding: .constant(false)).preferredColorScheme(.dark)
        }
        
        
    }
}
