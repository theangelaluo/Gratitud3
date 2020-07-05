//
//  PostModel.swift
//  Gratitud3
//
//  Created by Angela Luo on 7/4/20.
//  Copyright © 2020 Angela Luo. All rights reserved.
//

import Foundation

class PostModel {
    
    var username: String = ""
    var profilePicURL: String = ""
    var items: Array<String> = []
    
    init(_ username: String, _ profilePicURL: String, _ items: Array<String>) {
        self.username = username
        self.profilePicURL = profilePicURL
        self.items = items
    }
    
}
