//
//  LoginService.swift
//  Sopt28th_iOS_Assignment
//
//  Created by 한상진 on 2021/05/14.
//

import Foundation
import Alamofire

struct LoginService{
    static let shared = LoginService()
    
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password]
    }
    
    func login(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
        
        case 200:
            if let token = decodedData.data?.token {
                UserDefaults.standard.set(token, forKey: "user_token")
            }
            print("저장된 토큰: ", UserDefaults.standard.value(forKey: "user_token")!)
            return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
