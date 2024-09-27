//
//  UserFeedDelete.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/23.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
