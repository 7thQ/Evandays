//
//  Post.swift
//  EAH
//
//  Created by cosmo on 2/4/24.
//

import Foundation



struct Post: Identifiable {
    let id = UUID()
    let user: User
    let postImage: String
    let caption: String
    let likes: String
    let hasLiked: Bool = false
    let hasBookmarked: Bool = false
}
