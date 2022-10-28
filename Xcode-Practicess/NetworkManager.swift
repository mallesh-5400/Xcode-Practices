//
//  NetworkManager.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/18/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func getAPIData(amiibo: @escaping([AmiiboModel]) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: "https://amiiboapi.com/api/amiibo/")!) {
            data, _, error in
            
            if data != nil && data?.count != 0 {
                //let data = String(data: data!, encoding: .utf8)
                do {
                    let result = try JSONDecoder().decode(AmiiboList.self, from: data!)
                    amiibo(result.amiibo)
                    print(data!)
                } catch {
                    print(error)
                }
                
            } else {
                print(error as Any)
            }
        }.resume()
    }
    
    func getUserAPIData<T: Decodable>(url: URL?, resultType:T.Type ,completionHandler: @escaping(_ model: T?) -> Void) {
        
        guard let url = url else {
            debugPrint("URL is not corrcct")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if data != nil && data?.count != 0 {
                //let data = String(data: data!, encoding: .utf8)
                do {
                    let result = try JSONDecoder().decode(T.self, from: data!)
                    completionHandler(result)
                    print(result)
                } catch {
                    print(error)
                }
                
            } else {
                let responseMsg = response as? HTTPURLResponse
                print(responseMsg as Any)
                print(error.debugDescription)
            }
        }.resume()
    }
    
    
}
