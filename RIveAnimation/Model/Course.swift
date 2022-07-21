//
//  Course.swift
//  RIveAnimation
//
//  Created by Dilshad N on 17/07/22.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "SwiftUI Cookbook", subtitle: "A problem focused approach for learning SwiftUI to build iOS apps", caption: "18 sections - 4 hours", color: Color(hex: "7850F0"), image: Image("Topic 1")),
    Course(title: "Animations in SwiftUI", subtitle: "Build and animate an iOS app from scratch", caption: "20 sections - 3 hours", color: Color(hex: "6792FF"), image: Image("Topic 2")),
    Course(title: "Build Quick Apps with SwiftUI", subtitle: "Apply your Swift and SwiftUI knowledge by building real, quick and various applications from scratch", caption: "47 sections - 11 hours", color: Color(hex: "005FE7"), image: Image("Topic 1")),
    Course(title: "MVVM Design Pattern", subtitle: "Covers consuming JSON, Client-Server MVVM architecture, Screen-View Pattern", caption: "24 sections - 4 hours", color: Color(hex: "BBA6FF"), image: Image("Topic 2"))
    
]
