//
//  RecentCourseView.swift
//  RIveAnimation
//
//  Created by Dilshad N on 18/07/22.
//

import SwiftUI

struct RecentCourseView: View {
    var section: CourseSection
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(section.caption)
                    .customFont(.body)
            }
            Spacer()
            Divider()
            
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        
       
    }
}

struct RecentCourseView_Previews: PreviewProvider {
    static var previews: some View {
        RecentCourseView(section: courseSections[0] )
    }
}
