//
//  SideMenuType.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/24/23.
//

enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case programs
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .programs:
            return "Programs"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .programs:
            return "list.bullet.clipboard.fill"
        case .chat:
            return "message"
        case .profile:
            return "person.fill"
        }
    }
}
