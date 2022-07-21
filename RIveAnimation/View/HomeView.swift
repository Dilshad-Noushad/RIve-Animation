//
//  HomeView.swift
//  RIveAnimation
//
//  Created by Dilshad N on 18/07/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(courses) { course in
                        CourseCardView(course: course)
                    }
                }
                .padding(15)
                .padding(.bottom, 10)
            }
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal, 20)
            
            VStack {
                ForEach(courseSections) { section in
                    RecentCourseView(section: section)
                }
            }
            .padding(15)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
