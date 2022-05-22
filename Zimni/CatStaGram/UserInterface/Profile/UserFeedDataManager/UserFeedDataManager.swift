//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/23.
//

import Alamofire

class UserFeedDataManager {
    
    func getUserFeed(_ viewController: ProfileViewController,
                     _ userID: Int = 2) {
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("DEBUG: ", result)
            case .failure(let error):
                print(error.localizedDescription)   //error 원인 알아보기 위해
            }
        }
    }
}

