//
//  FeedUploadInput.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/23.
//

import UIKit

struct FeeduploadInput : Encodable {
    var content : String?
    var postImgsUrl : [String]?
}
