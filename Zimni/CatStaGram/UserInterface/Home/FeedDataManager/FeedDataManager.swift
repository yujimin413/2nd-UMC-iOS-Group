//
//  FeedDataManager.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/23.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)   //error 원인 알아보기 위해
            }
        }
    }
}
