//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/23.
//

import Alamofire

class UserFeedDataManager {
    // MARK: 유저 피드 조회 API
    func getUserFeed(_ viewController: ProfileViewViewController,
                     _ userID: Int = 2) {
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                
            switch response.result {
            case .success(let result):
                // print("DEBUG: ", result)
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)   //error 원인 알아보기 위해
            }
        }
    }
    
    // MARK: 게시물 삭제 API
    func deleteUserFeed(_ viewController: ProfileViewViewController,
                     _ postIdx: Int) {
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil)
            .validate()
            .responseDecodable(of: DeleteUserFeed.self) { response in
                
            switch response.result {
            case .success(let result):
                //print("DEBUG: ", result)
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)   //error 원인 알아보기 위해
            }
        }
    }
}


