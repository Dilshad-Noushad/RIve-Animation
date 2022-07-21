//
//  CourseCardView.swift
//  RIveAnimation
//
//  Created by Dilshad N on 18/07/22.
//

import SwiftUI

struct CourseCardView: View {
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.title)
                .customFont(.title2)
                .frame(width: 170, alignment: .leading)
                .layoutPriority(1)
            
            Text(course.subtitle)
                .customFont(.subheadline)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.caption.uppercased())
                .customFont(.footnote2)
            Spacer()
            HStack {
                //Array([2, 5, 3].shuffled().enumerated()), id: \.offset to get the indexpath
                ForEach(Array([2, 5, 3].shuffled().enumerated()), id: \.offset) { index, num in
                    Image("Person\(num)")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(.linearGradient(colors: [course.color, course.color.opacity(0.5)], startPoint: .topTrailing, endPoint: .bottomLeading))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: course.color.opacity(0.3), radius: 2, x: 0, y: 1)
        .overlay(
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20))
        
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView(course: courses[0])
    }
}
