//
//  SideMenuType.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/24/23.
//

enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case programs
    case approach
    case about
    case profile
    case quiz
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .approach:
            return "Approach"
        case .programs:
            return "Programs"
        case .about:
            return "About"
        case .profile:
            return "Profile"
        case .quiz:
            return "Quiz"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .approach:
            return "figure.run"
        case .programs:
            return "list.bullet.clipboard.fill"
        case .about:
            return "info.circle"
        case .profile:
            return "person.fill"
        case .quiz:
            return "clipboard"
        }
    }
}
